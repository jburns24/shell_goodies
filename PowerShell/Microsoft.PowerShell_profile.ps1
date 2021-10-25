# Set key handler so that ctrl + backspace deletes an entire word
# Set-PSReadLineKeyHandler -Key Ctrl+h -Function BackwardKillWord

# Import-Module ZLocation

Import-Module posh-git

Import-Module "Oh-My-Posh" -DisableNameChecking -NoClobber

# this is like some strage bug but I like the outcome, I want the colors from
# robbyrussell but on the sorin layout
Set-PoshPrompt robbyrussell
Set-PoshPrompt Lambda

$runningScriptPath = $MyInvocation.MyCommand.Path
if ((Get-Item $runningScriptPath).LinkType -eq 'SymbolicLink') {
    $runningScriptPath = (Get-Item $runningScriptPath).Target
    $scriptRootPath = (Get-Item $runningScriptPath).Directory
} else {
}

# This is to resolve the following issue https://stackoverflow.com/questions/35176270/python-2-7-lookuperror-unknown-encoding-cp65001
$env:PYTHONIOENCODING = "UTF-8"

$GitPromptSettings.EnableFileStatus = $false
#$GitPromptSettings.EnableFileStatus = $true
# $GitPromptSettings.RepositoriesInWhichToDisableFileStatus += 'C:\Path\To\Project'

$GitPromptSettings.BeforeText                                  = ' ('
$GitPromptSettings.BeforeForegroundColor                       = [ConsoleColor]::Blue
# $GitPromptSettings.BeforeBackgroundColor                       = $null

# $GitPromptSettings.DelimText                                   = ' |'
# $GitPromptSettings.DelimForegroundColor                        = [ConsoleColor]::Yellow
# $GitPromptSettings.DelimBackgroundColor                        = $null

$GitPromptSettings.AfterText                                   = ')'
$GitPromptSettings.AfterForegroundColor                        = [ConsoleColor]::Blue
# $GitPromptSettings.AfterBackgroundColor                        = $null

# $GitPromptSettings.FileAddedText                               = '+'
# $GitPromptSettings.FileModifiedText                            = '~'
# $GitPromptSettings.FileRemovedText                             = '-'
# $GitPromptSettings.FileConflictedText                          = '!'

# $GitPromptSettings.LocalDefaultStatusSymbol                    = $null
# $GitPromptSettings.LocalDefaultStatusForegroundColor           = [ConsoleColor]::DarkGreen
# $GitPromptSettings.LocalDefaultStatusForegroundBrightColor     = [ConsoleColor]::Green
# $GitPromptSettings.LocalDefaultStatusBackgroundColor           = $null

# $GitPromptSettings.LocalWorkingStatusSymbol                    = '!'
# $GitPromptSettings.LocalWorkingStatusForegroundColor           = [ConsoleColor]::DarkRed
# $GitPromptSettings.LocalWorkingStatusForegroundBrightColor     = [ConsoleColor]::Red
# $GitPromptSettings.LocalWorkingStatusBackgroundColor           = $null

# $GitPromptSettings.LocalStagedStatusSymbol                     = '~'
# $GitPromptSettings.LocalStagedStatusForegroundColor            = [ConsoleColor]::Cyan
# $GitPromptSettings.LocalStagedStatusBackgroundColor            = $null

# $GitPromptSettings.BranchUntrackedSymbol                       = $null
$GitPromptSettings.BranchForegroundColor                       = [ConsoleColor]::Red
# $GitPromptSettings.BranchBackgroundColor                       = $null

# $GitPromptSettings.BranchGoneStatusSymbol                      = [char]0x00D7 # ?? Multiplication sign
# $GitPromptSettings.BranchGoneStatusForegroundColor             = [ConsoleColor]::DarkCyan
# $GitPromptSettings.BranchGoneStatusBackgroundColor             = $null

# $GitPromptSettings.BranchIdenticalStatusToSymbol               = [char]0x2261 # ??? Three horizontal lines
# $GitPromptSettings.BranchIdenticalStatusToForegroundColor      = [ConsoleColor]::Cyan
# $GitPromptSettings.BranchIdenticalStatusToBackgroundColor      = $null

# $GitPromptSettings.BranchAheadStatusSymbol                     = [char]0x2191 # ??? Up arrow
# $GitPromptSettings.BranchAheadStatusForegroundColor            = [ConsoleColor]::Green
# $GitPromptSettings.BranchAheadStatusBackgroundColor            = $null

# $GitPromptSettings.BranchBehindStatusSymbol                    = [char]0x2193 # ??? Down arrow
# $GitPromptSettings.BranchBehindStatusForegroundColor           = [ConsoleColor]::Red
# $GitPromptSettings.BranchBehindStatusBackgroundColor           = $null

# $GitPromptSettings.BranchBehindAndAheadStatusSymbol            = [char]0x2195 # ??? Up & Down arrow
# $GitPromptSettings.BranchBehindAndAheadStatusForegroundColor   = [ConsoleColor]::Yellow
# $GitPromptSettings.BranchBehindAndAheadStatusBackgroundColor   = $null

# $GitPromptSettings.BeforeIndexText                             = ""
# $GitPromptSettings.BeforeIndexForegroundColor                  = [ConsoleColor]::DarkGreen
# $GitPromptSettings.BeforeIndexForegroundBrightColor            = [ConsoleColor]::Green
# $GitPromptSettings.BeforeIndexBackgroundColor                  = $null

# $GitPromptSettings.IndexForegroundColor                        = [ConsoleColor]::DarkGreen
# $GitPromptSettings.IndexForegroundBrightColor                  = [ConsoleColor]::Green
# $GitPromptSettings.IndexBackgroundColor                        = $null

# $GitPromptSettings.WorkingForegroundColor                      = [ConsoleColor]::DarkRed
# $GitPromptSettings.WorkingForegroundBrightColor                = [ConsoleColor]::Red
# $GitPromptSettings.WorkingBackgroundColor                      = $null

# $GitPromptSettings.EnableStashStatus                           = $false
# $GitPromptSettings.BeforeStashText                             = ' ('
# $GitPromptSettings.BeforeStashBackgroundColor                  = $null
# $GitPromptSettings.BeforeStashForegroundColor                  = [ConsoleColor]::Red
# $GitPromptSettings.AfterStashText                              = ')'
# $GitPromptSettings.AfterStashBackgroundColor                   = $null
# $GitPromptSettings.AfterStashForegroundColor                   = [ConsoleColor]::Red
# $GitPromptSettings.StashBackgroundColor                        = $null
# $GitPromptSettings.StashForegroundColor                        = [ConsoleColor]::Red

# $GitPromptSettings.ErrorForegroundColor                        = [ConsoleColor]::Red
# $GitPromptSettings.ErrorBackgroundColor                        = $null

# $GitPromptSettings.ShowStatusWhenZero                          = $true

# $GitPromptSettings.AutoRefreshIndex                            = $true

# # Valid values are "Full", "Compact", and "Minimal"
# $GitPromptSettings.BranchBehindAndAheadDisplay                 = "Full"

# $GitPromptSettings.EnablePromptStatus                          = !$Global:GitMissing
# $GitPromptSettings.EnableFileStatus                            = $true
# $GitPromptSettings.EnableFileStatusFromCache                   = $null
# $GitPromptSettings.RepositoriesInWhichToDisableFileStatus      = @( ) # Array of repository paths
# $GitPromptSettings.DescribeStyle                               = ''

$GitPromptSettings.EnableWindowTitle                           = ''

# $GitPromptSettings.DefaultPromptPrefix                         = ''
# $GitPromptSettings.DefaultPromptSuffix                         = '$(''>'' * ($nestedPromptLevel + 1)) '
# $GitPromptSettings.DefaultPromptDebugSuffix                    = ' [DBG]$(''>'' * ($nestedPromptLevel + 1)) '
# $GitPromptSettings.DefaultPromptEnableTiming                   = $false
# $GitPromptSettings.DefaultPromptAbbreviateHomeDirectory        = $false

# $GitPromptSettings.Debug                                       = $false

# $GitPromptSettings.BranchNameLimit                             = 0
# $GitPromptSettings.TruncatedBranchSuffix                       = '...'


# Set up a simple prompt, adding the git prompt parts inside git repos
# function global:prompt {
#     $realLASTEXITCODE = $LASTEXITCODE

#     Write-Host ($pwd.ProviderPath) -nonewline -ForegroundColor Cyan
#     Write-VcsStatus
#     #Write-Host " ???" -nonewline -ForegroundColor Yellow
#     #Write-Host " ??" -nonewline -ForegroundColor Yellow
#     #Write-Host ">" -nonewline -ForegroundColor Cyan
#     # Write-Host (" " + [char]0x00D7) -nonewline -ForegroundColor Yellow
#     # Write-Host (" " + [char]0x0283) -nonewline -ForegroundColor Yellow # derivative symbol
#     # Write-Host (" " + [char]0x16B7) -nonewline -ForegroundColor Yellow # derivative symbol
#     # Write-Host ([char]0x26A1) -nonewline -ForegroundColor Yellow # derivative symbol
#     Write-Host (" " + [char]0x2794) -nonewline -ForegroundColor Yellow # derivative symbol


#     $global:LASTEXITCODE = $realLASTEXITCODE
#     return " "
# }

<#
# setup the visual studio path
Get-ChildItem ${env:ProgramFiles(x86)} -Filter 'Microsoft Visual Studio *' | % { $_.FullName } | Sort-Object -Descending | % {
    If (!($vsPath) -And (Test-Path "$_\VC\vcvarsall.bat")) {
        write-host "Using build toolchain: $_" -ForegroundColor Yellow
        $vsPath = "$_\VC"
    }
}

if (!(Test-Path $vsPath)) {
    Write-Error "This script requires visual studio and its build toolchain, but was not found."
    exit 1
}

#Set environment variables for Visual Studio Command Prompt
pushd $vsPath
cmd /c "vcvarsall.bat&set" | ? { $_ -match "=" } | % {
    $v = $_.split("=");
    Set-Item -Force -Path "ENV:\$($v[0])" -Value "$($v[1])"
}
popd
write-host "Visual Studio Command Prompt variables set." -ForegroundColor Yellow
#>

$scriptDir = Split-Path $script:MyInvocation.MyCommand.Path

@(
        '.\Functions\*.ps1'
) | % {
        Get-ChildItem ($scriptDir + $_) | % { . "$_" }
}
# # Load Jump-Location profile
# Import-Module 'C:\Program Files\WindowsPowerShell\Modules\Jump.Location\0.6.0\Jump.Location.psd1'

# if (!(Get-Alias z -ErrorAction SilentlyContinue)) {
#       New-Alias z Jump-Location
# }

# Invoke-Build alias
if (!(Get-Alias ib -ErrorAction SilentlyContinue)) {
        New-Alias ib Invoke-Build
}

Set-PSReadlineKeyHandler -Key Tab -Function Complete
#Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key Ctrl+Spacebar -ScriptBlock { Invoke-GuiCompletion }

# this causes errors in python looking up codepage 65001
# LookupError: unknown encoding: cp65001
# [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
#
#$OutputEncoding = New-Object -typename System.Text.UTF8Encoding
#$PSDefaultParameterValues = @{ '*:Encoding' = 'utf8' }
#CHCP 65001

# info on unicode in powershell
# https://stackoverflow.com/questions/379240/is-there-a-windows-command-shell-that-will-display-unicode-characters
# https://blogs.msdn.microsoft.com/powershell/2006/12/11/outputencoding-to-the-rescue/

# interesting bash/windows aliases
# https://gist.github.com/iegik/7485025
# Chocolatey profile

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (!(Test-Path($ChocolateyProfile))) {
  Import-Module "$ChocolateyProfile"
}

$PSModulePathModifiers = @('C:\git\release-scripts\PSModules')
foreach ($p in $PSModulePathModifiers) {
    if (!(Test-Path -Path $p)) { Write-Error "$p is not a valid psmodule path"; continue}
    $env:PSModulePath = (@(Resolve-Path $p) + $env:PSModulePath -Split [System.IO.Path]::PathSeparator | Select-Object -Unique) -Join [System.IO.Path]::PathSeparator
}

$PathModifiers = @('C:\Users\jburns\.git-scripts', 'C:\Program Files\Git\usr\bin')
$PathModifiers += @('C:\Python27', 'C:\Python27\Scripts') # This is needed because fabric makes a script in the Scripts directory for the command 'fab'
foreach ($p in $PathModifiers) {
    if (!(Test-Path -Path $p)) { Write-Error "$p is not a valid path"; continue}
    $env:Path = (@(Resolve-Path $p) + $env:Path -Split [System.IO.Path]::PathSeparator | Select-Object -Unique) -Join [System.IO.Path]::PathSeparator
}


# Import custom scripts.
if (Test-Path (Join-Path $scriptRootPath 'CustomModules')) {
    # Found custom modules source them all
    $global:customModules = (Join-Path $scriptRootPath 'CustomModules')
    $scripts = Get-ChildItem $global:customModules
    Write-Host -ForegroundColor Green "Sourcing all custom modules found in $($global:customModules)"
    foreach ($script in ($scripts | ? { $_.Name -like "*.ps1" })) {
        . $script.FullName
    }
}

