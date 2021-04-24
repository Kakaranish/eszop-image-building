$repo_root = "$PSScriptRoot\..\..\.."
Import-Module "${repo_root}\modules\Save-Cache.psm1" -Force

# ------------------------------------------------------------------------------

$config = Get-Content -Path "${repo_root}\config.yaml" | ConvertFrom-Yaml

$timestamp = Get-Date -UFormat "+%Y%m%d-%H%M%S"
$image_name = "redis-$timestamp"

packer build `
  -var "project_id=$($config.GCP_PROJECT_ID)" `
  -var "image_name=${image_name}" `
  "$PSScriptRoot\..\redis.json"

if ($LASTEXITCODE -eq 0) {
  $build_info = @{ image_name = $image_name }
  Save-Cache -Path "$PSScriptRoot\.last_build" -Content $build_info
}