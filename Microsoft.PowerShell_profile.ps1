Import-Module oh-my-posh
Import-Module posh-git
Set-PoshPrompt -Theme Paradox
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

# All The alias Below This Line 
# Aliases


#Alias Function
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

#testing
function test {
    echo "Test"
}