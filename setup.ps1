#This is a setup script to setup windows 10 after a fresh install

#Change to A Temp Folder and  Download Main Script 
Set-Location C:\Users\Aaxyat\
mkdir .scrtmp
Set-Location C:\Users\Aaxyat\.scrtmp\

# Download Script.ps1
Invoke-WebRequest --UseBacicParsing -outf Script.ps1 https://raw.githubusercontent.com/aaxyat/Scripts/master/Script.ps1


#To Force The File to run as Admin
Start-Process "$psHome\powershell.exe" -Verb Runas -ArgumentList '-command "C:\Users\Aaxyat\.scrtmp\Script.ps1"'
