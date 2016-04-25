# Author: Miodrag Milic <miodrag.milic@gmail.com>
# Last Change: 14-Apr-2016.

<#
.SYNOPSIS
    Remove the TFS build
#>
function Remove-Build {
    [CmdletBinding()]
    param (
        #Build ID
        [int] $Id
    )
    check_credential

    $uri = "$proj_uri/_apis/build/builds/$($Id)?api-version=" + $global:tfs.api_version
    Write-Verbose "URI: $uri"

    $params = @{ Uri = $uri; Method = 'Delete'}
    invoke_rest $params | Out-Null
}
