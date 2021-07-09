Import-Module oh-my-posh
Import-Module posh-git
Set-PoshPrompt -Theme Paradox
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

Write-Output "type 'shortcuts' to see all Shortcuts"
# All The alias Below This Line 
# Aliases


#Alias Function
#List All Sortcuts

function shortcuts{
    Write-Output "refresh => reload Profile"
    Write-Output "cd.. => cd .."
    Write-Output "code => code-insiders"
    Write-Output "createvenv => create a New virtualenv"
    Write-Output "listvenv => List all Virtualenv"
    Write-Output "removevenv => remove given virtualenv"
    Write-Output "workon => workon The given Venv"
}
function cd.. {
    Set-Location ..
    
}
function code {
    code-insiders $args
}


# Virtualenv
function createvenv{
    $d = "C:\Users\Aaxyat\envs\" + $args
    New-Item -Path $d -ItemType directory
    python -m venv $d
}

function removeenv {
    $d = "C:\Users\Aaxyat\envs\" + $args
    Remove-Item $d -Recurse
}

function listenv {
    Get-ChildItem C:\Users\Aaxyat\envs
}

function workon {
    $d = "C:\Users\Aaxyat\envs\"+$args+"\Scripts\Activate.ps1"
    & $d
}

#Git Stuff


#This is Conda environment If I ever need to use conda 
# function create-env {
#     conda create --name $args python 
# }
# function workon {
#     conda activate $args 
# }
# function listenv {
#     conda env list
# }
# function remove-env {
#     conda env remove -n $args
# }


function refresh{
    . $profile
}
