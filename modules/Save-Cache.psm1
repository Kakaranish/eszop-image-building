function Save-Cache {
  param (
    [Parameter(Mandatory = $true)]    
    [hashtable] $Content,

    [Parameter(Mandatory = $true)]    
    [string] $Path
  )
    
  New-Item -ItemType File -Path $Path -Force | Out-Null
  $Content | ConvertTo-Yaml | Set-Content $Path -NoNewline
}

Export-ModuleMember -Function Save-Cache