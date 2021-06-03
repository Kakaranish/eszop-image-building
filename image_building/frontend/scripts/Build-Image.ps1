param(
    [Parameter(Mandatory = $true)]
    [string] $BuildSuffix
)

$repo_root = "$PSScriptRoot\..\..\.."
Import-Module "${repo_root}\modules\Build-GenericImage.psm1" -Force

# ------------------------------------------------------------------------------

Build-GenericImage `
  -BuildSuffix $BuildSuffix `
  -PackerEntrypointPath "$PSScriptRoot\..\eszop_frontend.json" `
  -FunctionalityName "frontend" `
  -BuildHistoryPath ".build_history"