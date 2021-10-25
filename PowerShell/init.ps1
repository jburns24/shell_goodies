#Requires -RunAsAdministrator
# This script just 'sets' up your profile by creating a symbolic link from the managed profile to the default locaiton of the powershell profile
New-Item -ItemType SymbolicLink -Target (Join-Path $PSScriptRoot "Microsoft.PowerShell_profile.ps1") -Path $Profile -Verbose -Force
