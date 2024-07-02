# automatic-speedtest-with-powershell
An automated speed test script using Ookla CLI and Windows PowerShell, allowing you to choose the test frequency in minutes.

To use this script, you need to download Ookla CLI from the following link: https://www.speedtest.net/apps/cli

After that, you must extract the zip file and run speedtest.exe to accept the license.

Download the script "automatic-speedtest-with-powershell.ps1" and insert it into the Ookla directory.

Open PowerShell in administrator mode.

Navigate to the directory using the cd command and run the script.

Now, you need to specify the output file name and how often you want to run the speed test in minutes.

Upon running the script, it will create an output file with the name you specified in the same directory as the script. It will perform a speed test every x minutes in an infinite loop and append all conducted speed tests to the designated file until stopped. To stop it, press Ctrl+C

Example to execute the script:

    PS C:\> cd C:\Users\alex-\Desktop\ookla-speedtest-1.2.0-win64

    PS C:\Users\alex-\Desktop\ookla-speedtest-1.2.0-win64> dir


    Directory: C:\Users\alex-\Desktop\ookla-speedtest-1.2.0-win64


    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a----        02/07/2024     22:07           3405 automatic-speedtest-with-powershell.ps1
    -a----        02/07/2024     21:35          10858 outpout example.txt
    -a----        02/07/2024     10:19        2264064 speedtest.exe
    -a----        02/07/2024     10:19          13759 speedtest.md


    PS C:\Users\alex-\Desktop\ookla-speedtest-1.2.0-win64>
    PS C:\Users\alex-\Desktop\ookla-speedtest-1.2.0-win64> .\automatic-speedtest-with-powershell.ps1
