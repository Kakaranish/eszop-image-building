function Add-ToBuildHistory {
  param (
    [Parameter(Mandatory = $true)]    
    [hashtable] $Content,

    [Parameter(Mandatory = $true)]    
    [string] $Path
  )
  
  $build_history_json = @{"builds" = @() }
  if (Test-Path -Path $Path) {
    $build_history_json = Get-Content -Path $Path | ConvertFrom-Json
  }

  $build_history_json.builds += [PSCustomObject] $Content
    
  $build_history_json | ConvertTo-Json -Depth 10 | Set-Content $Path -NoNewline | Out-Null
}

Export-ModuleMember -Function Add-ToBuildHistory