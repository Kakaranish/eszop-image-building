Import-Module "$PSScriptRoot\Save-Cache.psm1" -Force

function Build-GenericImage {
  param(
    [Parameter(Mandatory = $true)]
    [string] $BuildSuffix,
  
    [Parameter(Mandatory = $true)]
    [string] $PackerEntrypointPath,
  
    [Parameter(Mandatory = $true)]
    [string] $FunctionalityName,
  
    [Parameter(Mandatory = $true)]
    [string] $CachePath
  )

  $repo_root = "$PSScriptRoot\.."
  $config = Get-Content -Path "${repo_root}\config.yaml" | ConvertFrom-Yaml
  $timestamp = Get-Date -UFormat "+%Y%m%d-%H%M%S"
  $image_name = "eszop-$FunctionalityName-$timestamp"
  packer build `
    -var "project_id=$($config.GCP_PROJECT_ID)" `
    -var "package_storage_name=$($config.GCP_PACKAGE_STORAGE)" `
    -var "build_suffix=$BuildSuffix" `
    -var "image_name=${image_name}" `
    $PackerEntrypointPath
  
  if ($LASTEXITCODE -eq 0) {
    $build_info = @{
      build_suffix = $BuildSuffix; 
      image_name   = $image_name
    }
    Save-Cache -Path $CachePath -Content $build_info
  }
}

Export-ModuleMember -Function Build-GenericImage