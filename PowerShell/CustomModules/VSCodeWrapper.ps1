function Set-TempFile {
    param (
        [String]
        $Content,
        [String]
        [ValidateScript({ Test-Path $_ })]
        $TempPath = (Join-Path $env:TMP ("temp-file-{0}.tmp" -f [int](get-date -UFormat %s)))
    )
    Write-Host "content is $content"
    Write-Host "Location is is $TempPath"
}
