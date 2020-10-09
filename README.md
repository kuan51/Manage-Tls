# Manage-Tls
Powershell module to turn on/off TLS protocols for Windows. 
This tool relies on True/False booleans to turn on/off the various TLS and SSL versions.
Admin privileges are required as the script is making registry edits per the [Microsoft docs](https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/operations/manage-ssl-protocols-in-ad-fs).

True = Enable the protocol

False = Disable the protocol

## Using the Module
1. Import the module to powershell
```
import-module C:/path/to/Manage-Tls.psm1
```
2. Run and provide either $True (enable) or $False (disable)
```
Manage-Tls -ssl3 $false
Manage-Tls -tls12 $true
```
Currently supports the following switches:
```
-ssl2 # SSLv2
-ssl3 # SSLv3
-tls1 # TLSv1
-tls11 # TLSv1.1
-tls12 # TLSv.12
```
