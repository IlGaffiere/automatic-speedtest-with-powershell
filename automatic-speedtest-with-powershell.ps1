param (
    [switch]$VerboseMode
)

function Write-VerboseMessage {
    param (
        [string]$message
    )
    if ($VerboseMode) {
        Write-Host $message
    }
}
$asciiArt = @"
                                       /\_/\           ___	
                                      = o_o =_______    \ \ 
                                       __^      __(  \.__) )
                                   (@)<_____>__(_____)____/ 
"@
Write-Output $asciiArt
Write-Host "|********************************************************************************************|"
Write-Host "|********************************************************************************************|"
Write-Host "|********************************************************************************************|"
Write-Host "|***************Open the readme.txt file and review its contents.****************************|"
Write-Host "|***********This script uses an infinite loop. Press Ctrl+C to exit.*************************|"
Write-Host "|********************************************************************************************|"
Write-Host "|********************************************************************************************|"
Write-Host "|********************************************************************************************|"
$filename = Read-Host "Please enter the name for the output file"
$minutes = Read-Host "How often do you want the speed test to be executed (in minutes)?"
$minutes = [int]$minutes
$seconds = $minutes * 60
$filepath = ".\$filename.txt"

Write-VerboseMessage "Filename: $filename"
Write-VerboseMessage "Minutes: $minutes"
Write-VerboseMessage "Seconds: $seconds"
Write-VerboseMessage "Filepath: $filepath"

Write-Host "The speed test will be executed every $minutes minutes" | Add-Content -Path $filepath

# Crea il file se non esiste, se esiste non lo sovrascrive
if (-Not (Test-Path -Path $filepath)) {
    Write-Host "Creating the file in $filepath"
    Get-Date | Out-File -FilePath $filepath -NoClobber
	Write-Host "Executing the first speed test..."
    .\speedtest.exe | Add-Content -Path $filepath
    Write-Host "______________________________________________________" | Add-Content -Path $filepath
	Write-Host "Waiting for $minutes minuts..."
    Start-Sleep -Seconds $seconds
	$total_speedtest = [int]2
	while ($true) {
		# infinite loop, press Ctrl+C for exit
        Write-Host "Executing speed test number $total_speedtest..."
        Get-Date | Add-Content -Path $filepath
        .\speedtest.exe | Add-Content -Path $filepath
        Write-Host "______________________________________________________" | Add-Content -Path $filepath
        Write-Host "Waiting for $minutes minuts..."
        Start-Sleep -Seconds $seconds
		$total_speedtest++
    }
} else {
    # infinite loop, press Ctrl+C for exit
    Write-Host "The file exists, we can add new output."
	$total_speedtest = [int]1
    while ($true) {
        Write-Host "Executing speed test number $total_speedtest..."
        Get-Date | Add-Content -Path $filepath
        .\speedtest.exe | Add-Content -Path $filepath
        Write-Host "______________________________________________________" | Add-Content -Path $filepath
        Write-Host "Waiting for $minutes minuts..."
        Start-Sleep -Seconds $seconds
		$total_speedtest++
    }
}