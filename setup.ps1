#This is a setup script to setup windows 10 after a fresh install


#To Force The File to run as Admin
Start-Process "$psHome\powershell.exe" -Verb Runas -ArgumentList '-command "C:\Users\Aaxyat\.scrtmp\Script.ps1"'
