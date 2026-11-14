# Create RDP user with fixed password
$password = "15015795795"
$securePass = ConvertTo-SecureString $password -AsPlainText -Force
New-LocalUser -Name "vum" -Password $securePass -AccountNeverExpires
Add-LocalGroupMember -Group "Administrators" -Member "vum"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "vum"
echo "RDP_CREDS=User: vum | Password: $password" >> $env:GITHUB_ENV
if (-not (Get-LocalUser -Name "vum")) { throw "User creation failed" }
