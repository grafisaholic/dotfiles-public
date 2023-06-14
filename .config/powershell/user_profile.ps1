# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox

# Icons
Import-Module -Name Terminal-Icons

# Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'theme\amro.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-expression

# PSReadline
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle None
Set-PSReadlineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadlineOption -PredictionSource History
#Set-PSReadLineOption -predictionViewStyle Listview

# Alias
Set-Alias ll ls
Set-Alias vim nvim
Set-Alias vi nvim

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue | 
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
