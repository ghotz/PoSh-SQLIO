cls
1..48 | % { md ("C:\FT\DATA{0:00}" -f $_) }	# Create test dirs
foreach ($i in 1..48)
{
	$TestFileName = "C:\FT\DATA{0:00}\testfile.dat" -f $i
	$LogFileName =  "C:\TEMP\sqlio_seq_kR_t2_s30_o60_b512_DATA{0:00}.txt" -f $i
	FSUTIL.EXE file createnew "$TestFileName" (1GB)
	FSUTIL.EXE file setvaliddata "$TestFileName" (1GB)
	C:\SQLIO\sqlio -kR -t2 -s30 -o60 -fsequential -b512 -LS -BN "$TestFileName" 2>&1 > "$LogFileName"
	del "$TestFileName"
}