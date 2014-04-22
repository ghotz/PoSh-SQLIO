PoSh-SQLIO
==========

PowerShell Scripts to automate SQL Server benchmarking with SQLIO.

sqlio-baseline-disk.ps1
-----------------------
The purpose of this script is to automate running SQLIO multiple times with different combination of parameters to baseline the performance of a volume.

Most parameters are related to SQLIO excution with out-of-the box defaults for the
common scenario. Furthermore the following features are supported:
  - ability to estimate only the time to complete all tests
  - progress bar with time to completion updated after every test run
  - ability to range through parameters intervals either by single or by power of 2 steps
  - ability to generate one single log file or one log file per test run
