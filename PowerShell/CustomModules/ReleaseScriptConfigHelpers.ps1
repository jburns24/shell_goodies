function Get-AuctivaConfig {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [Switch]
        $Dev,

        [Parameter(Mandatory=$false)]
        [Switch]
        $Main
    )

    if ($Dev) {
        return . "C:\git\release-scripts\Auctiva\configs\dev1.config.ps1"
    }
    if ($Main) {
        return . "C:\git\release-scripts\Auctiva\configs\main1.config.ps1"
    }
    return . "C:\git\release-scripts\Auctiva\configs\production.config.ps1"
}
function Get-SniperConfig {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [Switch]
        $Dev,

        [Parameter(Mandatory=$false)]
        [Switch]
        $Main
    )

    if ($Dev) {
        return . "C:\git\release-scripts\AuctionSniper\configs\devel.config.ps1"
    }
    if ($Main) {
        return . "C:\git\release-scripts\AuctionSniper\configs\main1.config.ps1"
    }
    return . "C:\git\release-scripts\AuctionSniper\configs\production.config.ps1"
}
function Get-CommerceConfig {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [Switch]
        $Dev,

        [Parameter(Mandatory=$false)]
        [Switch]
        $Main
    )

    if ($Dev) {
        return . "C:\git\release-scripts\Commerce\configs\dev1.config.ps1"
    }
    if ($Main) {
        return . "C:\git\release-scripts\Commerce\configs\main1.config.ps1"
    }
    return . "C:\git\release-scripts\Commerce\configs\production.config.ps1"
}
