param(
  [Parameter(Mandatory = $true)]
  [string] $BuildSuffix,

  [Parameter(Mandatory = $true)]
  [ValidateSet("gateway", "carts", "identity", "notification", "offers", "orders")]
  [string] $Service
)

$repo_root = "$PSScriptRoot\..\..\.."
Import-Module "${repo_root}\modules\Build-GenericImage.psm1" -Force

# ------------------------------------------------------------------------------

Build-GenericImage `
  -BuildSuffix $BuildSuffix `
  -PackerEntrypointPath "$PSScriptRoot\..\eszop_backend.json" `
  -FunctionalityName $Service `
  -BuildHistoryPath ".build_history"