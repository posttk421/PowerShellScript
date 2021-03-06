#Add PSUnit folder to PATH environment variable e.g.: $env:path = $env:path + ";C:\SCHREIBTISCH\SVN\PS\PSUnit"
#This can be done for example in the PowerShell_ISE or PowerShell profile. 
Set-DebugMode
#Set-ProductionMode
#Change the directory to point to the test script files and scripts under test
cd C:\SCHREIBTISCH\SVN\PS\DownloadWeatherHistory

#Launch PSUnit test runner
PSUnit.Run.ps1 -PSUnitTestFile Interpolate-Records.Test.ps1 -ShowReportInBrowser

#Launch PSUnit test runner with Category "FastTests"
PSUnit.Run.ps1 -PSUnitTestFile Interpolate-Records.Test.ps1 -Category "FastTests"