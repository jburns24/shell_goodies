$host.ui.RawUI.WindowTitle = ""

Import-Module posh-git

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

# $GitPromptSettings.BranchGoneStatusSymbol                      = [char]0x00D7 # × Multiplication sign
# $GitPromptSettings.BranchGoneStatusForegroundColor             = [ConsoleColor]::DarkCyan
# $GitPromptSettings.BranchGoneStatusBackgroundColor             = $null

# $GitPromptSettings.BranchIdenticalStatusToSymbol               = [char]0x2261 # ≡ Three horizontal lines
# $GitPromptSettings.BranchIdenticalStatusToForegroundColor      = [ConsoleColor]::Cyan
# $GitPromptSettings.BranchIdenticalStatusToBackgroundColor      = $null

# $GitPromptSettings.BranchAheadStatusSymbol                     = [char]0x2191 # ↑ Up arrow
# $GitPromptSettings.BranchAheadStatusForegroundColor            = [ConsoleColor]::Green
# $GitPromptSettings.BranchAheadStatusBackgroundColor            = $null

# $GitPromptSettings.BranchBehindStatusSymbol                    = [char]0x2193 # ↓ Down arrow
# $GitPromptSettings.BranchBehindStatusForegroundColor           = [ConsoleColor]::Red
# $GitPromptSettings.BranchBehindStatusBackgroundColor           = $null

# $GitPromptSettings.BranchBehindAndAheadStatusSymbol            = [char]0x2195 # ↕ Up & Down arrow
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
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host ($pwd.ProviderPath) -nonewline -ForegroundColor Cyan
    Write-VcsStatus
    #Write-Host " ✗" -nonewline -ForegroundColor Yellow
    #Write-Host " »" -nonewline -ForegroundColor Yellow
    #Write-Host ">" -nonewline -ForegroundColor Cyan
    Write-Host (" " + [char]0x00D7) -nonewline -ForegroundColor Yellow

    $global:LASTEXITCODE = $realLASTEXITCODE
    return " "
}

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

# Loading custom scripts
# $scriptDir = Split-Path $script:MyInvocation.MyCommand.Path

# @(
# 	'.\Functions\*.ps1'
# ) | % {
# 	Get-ChildItem ($scriptDir + $_) | % { . "$_" }
# }
# Load Jump-Location profile
Import-Module ZLocation

Set-PSReadlineKeyHandler -Key Tab -Function Complete
#Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key Ctrl+Spacebar -ScriptBlock { Invoke-GuiCompletion }
Set-PSReadlineOption -Colors @{ "Command" =  "Green" }
Set-PSReadLineKeyHandler -Key Ctrl+h -Function BackwardKillWord
Set-PSReadLineKeyHandler -Key Ctrl+k -Function ForwardDeleteLine


# this causes errors in python looking up codepage 65001
# LookupError: unknown encoding: cp65001
# [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
#
#$OutputEncoding = New-Object -typename System.Text.UTF8Encoding
$PSDefaultParameterValues = @{ '*:Encoding' = 'utf8' }
#CHCP 65001

# info on unicode in powershell
# https://stackoverflow.com/questions/379240/is-there-a-windows-command-shell-that-will-display-unicode-characters
# https://blogs.msdn.microsoft.com/powershell/2006/12/11/outputencoding-to-the-rescue/

# interesting bash/windows aliases
# https://gist.github.com/iegik/7485025
