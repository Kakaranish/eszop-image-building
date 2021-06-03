param(
  [Parameter(Mandatory = $true)]
  [string] $BuildSuffix
)

$services = @("gateway", "carts", "identity", "notification", "offers", "orders")
foreach ($service in $services) {
  . "$PSScriptRoot\Build-Image.ps1" `
    -BuildSuffix $BuildSuffix `
    -Service $service
}