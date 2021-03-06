<#  
.SYNOPSIS  
	Automates disk baselining with SQLIO
.DESCRIPTION
	The purpose of this script is to automate running SQLIO multiple times with different
	combination of parameters to baseline the performance of a volume.
	
	Most parameters are related to SQLIO excution with out-of-the box defaults for the
	common scenario. Furthermore the following features are supported:
		- ability to estimate only the time to complete all tests
		- progress bar with time to completion updated after every test run
		- ability to range through parameters intervals either by single or by power of 2 steps
		- ability to generate one single log file or one log file per test run
	
	IMPORTANT: the script needs to be run with Administrator permissions because the "setvaliddata"
	command of FSUTIL.EXE requires it. Some code is provided to automatically re-run the script
	as Administrator however is commented because it will pop-up the request to run dialog and
	this may not be the expected bevaior when integrating the script with other scripts.
	Please note that "FSUTIL.EXE setvaliddata" doesn't stop the script if permissions are not
	granted and if it doesn't run, benchmark results will be completely wrong.
.PARAMETER TestFileName
	Full pathname of the data file that will be created an used by SQLIO to run the benchmark.
	If not specified, a file named sqliotestfile.dat is initialized under the current directory.
.PARAMETER TestFileSize
	Size of the data file used by SQLIO to run the benchmark.
	If not specified, defaults to 50GB
.PARAMETER Logdirectory
	Name of the directory where output files will be written.
	If not specified, a directory name "log" is created under the current one.
.PARAMETER MaxThreads
	Maximum number of threads to be used during the simulation.
	If not specified, it's set to the number of logical processors.
.PARAMETER MaxOutstandingIOs
	Maximum number of outstanding IOs.
	If not specified, defaults to 128.
.PARAMETER Seconds
	The number of seconds each SQLIO execution should run.
	If not set, defaults to 120.
.PARAMETER Latency
	Latency configuration: "-LS"=system "-LP"=processor ""=none.
	If not specified, defaults to -LS.
.PARAMETER Buffering
	Buffering configuration: "-BN"=none, "-BY"=all, "-BH"=hardware, "-BS"=software.
	If not specified, defaults to -BN.
.PARAMETER IncrementThreadsBy1
	Specifies that threads should be incremented by 1 instead of powers of 2.
.PARAMETER IncrementOutstandingIOsBy1
	Specifies that oustanding IOs should be incremented by 1 instead of powers of 2.
.PARAMETER EstimateTimeOnly
	Outputs only the total number of tests and the time estimated to complete.
.PARAMETER SingleLogFile
	Appends all tests results into a single log file.
.EXAMPLE
	sqlio-baseline-disk.ps1 -EstimateOnly
	Estimates only the duration of all tests using the default parameters:
		Test file name: sqliotestfile.dat (in the current directory)
		Test file size: 10GB
		Log directory: log (in the current directory)
		Maximum number of threads: set to number of cores
		Maximum number of oustanding IOs: 128
		Number of seconds to run each test: 30
		Latencies from: system (-LS)	
		Buffering: none (-BN)
		Number of threads: from 1 to number of cores in powers of 2 increments
		Oustanding IOs: from 1 to 128 in powers of 2 increments
		Logging: one file per test run
.EXAMPLE
	sqlio-baseline-disk.ps1 -Seconds 300
	Runs all tests using default configuration parameters except for the number of seconds
	each test should run which is set to minutes.
.EXAMPLE
	sqlio-baseline-disk.ps1 -TestFileName "E:\MyTestFile" -TestFileSize 50GB
	Runs all tests using default configuration parameters except it creates a specific
	test file (on a specific volume and a different name) with a size of 50GB.
.NOTES
	Version		: 1.0
	Author		: Gianluca Hotz - gianluca_hotz@hotmail.com
	Copyright	: (c) 2014, Gianluca Hotz (BSD 3-clause license)
.LINK
	http://www.ghotz.com
.LINK
	http://www.microsoft.com/en-us/download/details.aspx?id=20163
#>
param
(
	[string]$TestFileName = "sqliotestfile.dat",
	[long]$TestFileSize = (50GB),
	[string]$Logdirectory = "log",
	[int]$MaxThreads = (Get-WMIObject win32_Processor -Property NumberOfLogicalProcessors | Measure-Object NumberOfLogicalProcessors -sum).Sum,
	[int]$MaxOutstandingIOs = 128,
	[int]$Seconds = 120,
	[string]$Latency = "-LS",
	[string]$Buffering = "-BN",
	[switch]$IncrementThreadsBy1,
	[switch]$IncrementOutstandingIOsBy1,
	[switch]$EstimateTimeOnly,
	[switch]$SingleLogFile
);
#region Startup
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
	#$arguments = "& '" + $myinvocation.mycommand.definition + "'"
	#Start-Process powershell -Verb runAs -ArgumentList $arguments
	Write-Output "This script requires Administrator rights, please run PowerShell as Administrator and retry.";
	return
};

# Initialize array of common SQL Server tests
$Tests =
@(
	(8,		"W",	"random",		"checkpoints, tempdb, etc."),
	(8,		"W",	"sequential",	"bulk inserts"),
	(64,	"W",	"sequential",	"checkpoints, reindex, bulk inserts"),
	(128,	"W",	"sequential",	"bulk inserts, reindex"),
	(8,		"R",	"random",		"pattern for random data reads, singleton seeks, etc."),
	(64,	"R",	"sequential",	"read-ahead, reindex, checkdb"),
	(128,	"R",	"sequential",	"read-ahead, reindex, checkdb"),
	(256,	"R",	"sequential",	"read-ahead, reindex"),
	(1024,	"R",	"sequential",	"backups")
);

# Calculate test metrics
$TotalThreadTests = if ($IncrementThreadsBy1) {$MaxThreads} else {([Math]::Floor([Math]::Log($MaxThreads) / [Math]::Log(2)))+1};
$TotalOustandingIOTests = if ($IncrementOutstandingIOsBy1) {$MaxOutstandingIOs} else {([Math]::Floor([Math]::Log($MaxOutstandingIOs) / [Math]::Log(2)))+1};
$TotalTests = ($Tests.Count) * $TotalThreadTests * $TotalOustandingIOTests;
$TotalSecondsExpected = $TotalTests * $Seconds;

Write-Output "Running $TotalTests tests, expected elapsed time $([timespan]::FromSeconds($TotalSecondsExpected).ToString())";
if ($EstimateTimeOnly) { return };

Write-Progress -Activity "Test initialization" -Status "Processing" -CurrentOperation "Creating and initializing test file";
if ((Test-Path $TestFileName)) { Remove-Item -Path $TestFileName; };
FSUTIL.EXE file createnew "$TestFileName" $TestFileSize;
FSUTIL.EXE file setvaliddata "$TestFileName" $TestFileSize;

Write-Progress -Activity "Test initialization" -Status "Processing" -CurrentOperation "Creating log directory if missing...";
if (!(Test-Path $Logdirectory)) { New-Item -ItemType Directory -Path $Logdirectory; };
#endregion Startup
#region Main
$NumTest = 0;

foreach ($Test in $Tests)
{
	$ProgressMsg1 = "SQL Server test pattern: $($Test[3]).";
	Write-Progress -Activity $ProgressMsg1 -Status "Processing" -SecondsRemaining ($TotalSecondsExpected - ($NumTest * $Seconds));
	foreach ($Thread in 1..$MaxThreads)
	{
		if (!($Thread -band ($Thread - 1)) -or $IncrementThreadsBy1)
		{
			foreach ($OutstandingIO in 1..$MaxOutstandingIOs)
			{
				if (!($OutstandingIO -band ($OutstandingIO - 1)) -or $IncrementOutstandingIOsBy1)
				{
					$NumTest++;
					$ProgressMsg2 = "Testing for $($Seconds) seconds $($Test[2]) $(switch($Test[1]){'W' {'write'} 'R' {'read'}}) with $($Test[0])KB using $($Thread) thread(s) and $($OutstandingIO) outstanding IO(s)";
					Write-Progress -Activity $ProgressMsg1 -Status "Processing" -CurrentOperation $ProgressMsg2 -SecondsRemaining ($TotalSecondsExpected - ($NumTest * $Seconds)) -PercentComplete ((($NumTest * $Seconds) / $TotalSecondsExpected) * 100);
					$LogFileName = Join-Path $Logdirectory "sqlio_b$($Test[0])_k$($Test[1])_f$($Test[2])_s$($Seconds)_t$($Thread)_o$($OutstandingIO).txt";
					C:\Utils\SQLIO\sqlio.exe "-k$($Test[1])" "-t$($Thread)" "-s$($Seconds)" "-o$($OutstandingIO)" "-f$($Test[2])" "-b$($Test[0])" "$Latency" "$Buffering" "$TestFileName" 2>&1 > "$LogFileName"
				};
			};
		};
	};
};
#endregion Main