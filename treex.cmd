@ECHO OFF

SETLOCAL ENABLEEXTENSIONS
SET me=%~n0

SET source=%~1
SET level=%2

::Catch empty arguments
IF [%~1]==[] ECHO [%me%]~ A pathname is required directly after the command
IF [%2]==[] SET level=0 & ECHO [%me%]~ Level set to default


IF %level%==1 (
	ECHO [%me%]~ Creating level 1 tree report for %source% to target.txt...
	ECHO [%me%]~ The file will open once finished...
	tree /A %source% | findstr /R /C:"^+" /C:"^\\-" > target.txt
	ECHO [%me%]~ Done.
	target.txt
)

IF %level%==2 (
	ECHO [%me%]~ Creating level 2 tree report for %source% to target.txt...
	ECHO [%me%]~ The file will open once finished...
	tree /A %source% | findstr /R /C:"^+" /C:"^|   +" /C:"^|   \\-" /C:"^\\-" /C:"^    +" /C:"^    \\-" > target.txt
	ECHO [%me%]~ Done.
	target.txt
)

IF %level%==3 (
	ECHO [%me%]~ Creating level 3 tree report for %source% to target.txt...
	ECHO [%me%]~ The file will open once finished...
	tree /A %source% | findstr /R /C:"^+" /C:"^\\-" /C:"^....+" /C:"^....\\-" /C:"^........+-" /C:"^........\\-" > target.txt
	ECHO [%me%]~ Done.
	target.txt
)

IF %level%==4 (
	ECHO [%me%]~ Creating level 4 tree report for %source% to target.txt...
	ECHO [%me%]~ The file will open once finished...	
	tree /A %source% | findstr /R /C:"^+" /C:"^\\-" /C:"^....+" /C:"^....\\-" /C:"^........+-" /C:"^........\\-" /C:"^............\\-" /C:"^............+" > target.txt
	ECHO [%me%]~ Done.
	target.txt
)

IF %level%==5 (
	ECHO [%me%]~ Creating level 5 tree report for %source% to target.txt...
	ECHO [%me%]~ The file will open once finished...
	tree /A %source% | findstr /R /C:"^+" /C:"^\\-" /C:"^....+" /C:"^....\\-" /C:"^........+-" /C:"^........\\-" /C:"^............\\-" /C:"^............+" /C:"^................\\-" /C:"^................+-" > target.txt
	ECHO [%me%]~ Done.
	target.txt
)

IF %level%==6 (
	ECHO [%me%]~ Creating level 6 tree report for %source% to target.txt...
	ECHO [%me%]~ The file will open once finished...
	tree /A %source% | findstr /R /C:"^+" /C:"^\\-" /C:"^....+" /C:"^....\\-" /C:"^........+-" /C:"^........\\-" /C:"^............\\-" /C:"^............+" /C:"^................\\-" /C:"^................+-" /C:"^....................\\-" /C:"^....................+-" > target.txt
	ECHO [%me%]~ Done.
	target.txt
)

IF %level%==0 (
	SET level=3
	ECHO [%me%]~ Creating default tree report for %source% to target.txt...
	ECHO [%me%]~ The file will open once finished...
	tree /F /A %source% | findstr /R /C:"[^A-Z]" > target.txt
	ECHO [%me%]~ Done.
	target.txt
)