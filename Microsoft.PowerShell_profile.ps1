Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Invoke-Expression (&starship init powershell)

function acm {
    param(
      [Parameter(ValueFromRemainingArguments = $true)]
      [String[]] $message
    )
    git add .
    git commit -a -m "$message"
    git push
  }
  
