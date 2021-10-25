# this requires a configuraiton file.
class JiraConfig {
    [string]$BaseUrl
    [PSCredential]$Credential
}

[JiraConfig] $script:jiraConfiguration = $null

[string] $script:jiraConfigurationFilePath = [System.IO.Path]::Combine(
    [Environment]::GetFolderPath('LocalApplicationData'),
    'Auctiva',
    'Jira',
    'config.xml')

function Import-JiraConfiguration {
    if (Test-Path $script:jiraConfigurationFilePath) {
        $script:jiraConfiguration = Import-Clixml $script:jiraConfigurationFilePath
    }
}

function Set-JiraConfiguration {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [String]
        [ValidateScript({[Uri]::IsWellFormedUriString($_, 'Absolute')})]
        $BaseUrl,
        [PSCredential]
        $Credential
    )

    $persistentConfig = New-Object JiraConfig
    if (Test-Path $script:jiraConfigurationFilePath) {
        $persistentConfig = Import-Clixml -Path $script:jiraConfigurationFilePath -ErrorAction SilentlyContinue
    }
    if (!$persistentConfig) {
        $persistentConfig = New-Object JiraConfig
    }

    foreach ($p in [JiraConfig].GetProperties()) {
        $name = $p.Name
        if ($PSBoundParameters.ContainsKey($name)) {
            $persistentConfig.$name = $PSBoundParameters.$name
        }
    }

    $persistentConfig | Export-Clixml -Path $script:jiraConfigurationFilePath -Force | Out-Null
    $script:jiraConfiguration = $persistentConfig
}

function New-DevOpsJira {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True)]
        [String[]]
        [ValidateSet(
            "ActiveDirectory",
            "Architecture",
            "Auctiva",
            "Automation",
            "Build",
            "Chef",
            "CloudFlare",
            "Commerce",
            "Configuration",
            "Couchbase",
            "Database",
            "Deploy",
            "Development",
            "DNS",
            "Documentation"
        )]
        $Components,
        [Parameter(Mandatory=$True)]
        [String]
        $Title
    )
    Set-JiraConfigServer $script:jiraConfiguration.BaseUrl
    $JiraFields = @{}
    $JiraFields.components = @()
    foreach ($c in $Components) {
        $JiraFields.components += @{name=$c}
    }

    $jira = New-JiraIssue -Credential $script:jiraConfiguration.Credential `
        -Project DEVOPS `
        -IssueType Task `
        -Reporter "joshua.burns" `
        -Summary $Title `
        -Fields $JiraFields

    $summary = $jira |Select-Object -Property Key, HttpUrl | Format-Table | Out-String

    Write-Host -ForegroundColor Green "Summary"
    Write-Host -ForegroundColor Green "====================="
    Write-Host -ForegroundColor Green $summary
}
function New-AucJira {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True)]
        [String[]]
        # Verified the set of available components is the same across all accepted IssueTypes.
        [ValidateSet(
            "11 Main",
            "Admin",
            "adsense",
            "Automated Test",
            "Biling",
            "Billing",
            "Counters (Sellathon)",
            "Emails/MET",
            "Emporium",
            "find&replace-app",
            "Images",
            "Internal Tools",
            "Listings",
            "logging",
            "Marketing",
            "Marketplace",
            "Mobile",
            "My Account",
            "OpenSky",
            "Other",
            "Paid Advertising",
            "PlatformNotifications",
            "Profiles",
            "Reporting",
            "Sales",
            "Scrolling Gallery",
            "Services/Reconcilers",
            "Shipping Insurance/Labels",
            "Site Content (FAQs, TOS)",
            "Support Site",
            "Templates",
            "tutorials",
            "Visual Design",
            "Website"
        )]
        $Components,
        [Parameter(Mandatory=$False)]
        [String]
        [ValidateSet(
            'Task',
            'Bug',
            'New Feature'
        )]
        $IssueType = 'Task',
        [Parameter(Mandatory=$True)]
        [String]
        $Title
    )
    Set-JiraConfigServer $script:jiraConfiguration.BaseUrl
    $JiraFields = @{}
    $JiraFields.components = @()
    foreach ($c in $Components) {
        $JiraFields.components += @{name=$c}
    }

    $jira = New-JiraIssue -Credential $script:jiraConfiguration.Credential `
        -Project AUC `
        -IssueType $IssueType `
        -Reporter "joshua.burns" `
        -Summary $Title `
        -Fields $JiraFields

    $summary = $jira |Select-Object -Property Key, HttpUrl | Format-Table | Out-String

    Write-Host -ForegroundColor Green "Summary"
    Write-Host -ForegroundColor Green "====================="
    Write-Host -ForegroundColor Green $summary
}

Import-JiraConfiguration
