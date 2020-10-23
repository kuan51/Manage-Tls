function Manage-Tls
{
    Param
    (
         [Parameter(Mandatory=$false, ParameterSetName='ssl2')]
         [bool] $ssl2,
         [Parameter(Mandatory=$false, ParameterSetName='ssl3')]
         [bool] $ssl3,
         [Parameter(Mandatory=$false, ParameterSetName='tls1')]
         [bool] $tls1,
         [Parameter(Mandatory=$false, ParameterSetName='tls11')]
         [bool] $tls11,
         [Parameter(Mandatory=$false, ParameterSetName='tls12')]
         [bool] $tls12
    )

    $base_path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols'
    $fg_color = 'CYAN'

    switch($PsCmdlet.ParameterSetName){
    "ssl2" { ssl2 }
    "ssl3" { ssl3 }
    "tls1" { tls1 }
    "tls11" { tls11 }
    "tls12" { tls12 }
    }
}

function ssl2 {
  try {
    if($ssl2){
      New-Item "$base_path\SSL 2.0\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 2.0\Server" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 2.0\Server" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\SSL 2.0\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 2.0\Client" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 2.0\Client" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "SSLv2 Enabled" -ForegroundColor $fg_color
    }
    else {
      New-Item "$base_path\SSL 2.0\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 2.0\Server" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 2.0\Server" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\SSL 2.0\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 2.0\Client" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 2.0\Client" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "SSLv2 Disabled" -ForegroundColor $fg_color
    }
  }
  catch {
    Write-Host $_.Exception.Message -ForegroundColor RED
  }
  finally {
    $Error.Clear()
  }
}

function ssl3 {
  try {
    if($ssl3){
      New-Item "$base_path\SSL 3.0\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 3.0\Server" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 3.0\Server" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\SSL 3.0\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 3.0\Client" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 3.0\Client" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "SSLv3 Enabled" -ForegroundColor $fg_color
    }
    else {
      New-Item "$base_path\SSL 3.0\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 3.0\Server" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 3.0\Server" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\SSL 3.0\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 3.0\Client" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\SSL 3.0\Client" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "SSLv3 Disabled" -ForegroundColor $fg_color
    }
  }
  catch {
    Write-Host $_.Exception.Message -ForegroundColor RED
  }
  finally {
    $Error.Clear()
  }
}

function tls1 {
  try {
    if($tls1){
      New-Item "$base_path\TLS 1.0\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.0\Server" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.0\Server" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\TLS 1.0\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.0\Client" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.0\Client" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "TLSv1 Enabled" -ForegroundColor $fg_color
    }
    else {
      New-Item "$base_path\TLS 1.0\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.0\Server" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.0\Server" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\TLS 1.0\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.0\Client" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.0\Client" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "TLSv1 Disabled" -ForegroundColor $fg_color
    }
  }
  catch {
    Write-Host $_.Exception.Message -ForegroundColor RED
  }
  finally {
    $Error.Clear()
  }
}

function tls11 {
  try {
    if($tls11){
      New-Item "$base_path\TLS 1.1\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.1\Server" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.1\Server" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\TLS 1.1\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.1\Client" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.1\Client" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "TLSv1.1 Enabled" -ForegroundColor $fg_color
    }
    else {
      New-Item "$base_path\TLS 1.1\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.1\Server" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.1\Server" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\TLS 1.1\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.1\Client" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.1\Client" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "TLSv1.1 Disabled" -ForegroundColor $fg_color
    }
  }
  catch {
    Write-Host $_.Exception.Message -ForegroundColor RED
  }
  finally {
    $Error.Clear()
  }
}

function tls12 {
  try {
    if($tls12){
      New-Item "$base_path\TLS 1.2\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.2\Server" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.2\Server" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\TLS 1.2\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.2\Client" -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.2\Client" -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "TLSv1.2 Enabled" -ForegroundColor $fg_color
    }
    else {
      New-Item "$base_path\TLS 1.2\Server" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.2\Server" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.2\Server" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      New-Item "$base_path\TLS 1.2\Client" -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.2\Client" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
      New-ItemProperty -path "$base_path\TLS 1.2\Client" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
      Write-Host "TLSv1.2 Disabled" -ForegroundColor $fg_color
    }
  }
  catch {
    Write-Host $_.Exception.Message -ForegroundColor RED
  }
  finally {
    $Error.Clear()
  }
}

<# TO BE IMPLEMENTED
function tls13 {
  try {
    if($tls13){
        Write-Host "TLSv1.3 Enabled"
    }
    else {
        Write-Host "TLSv1.3 Disabled"
    }
  }
  catch {
    Write-Host $_.Exception.Message -ForegroundColor RED
  }
  finally {
    $Error.Clear()
  }
}
#>

Export-ModuleMember -Function 'Manage-Tls'
