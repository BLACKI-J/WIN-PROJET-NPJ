Commandes PowerShell

Installer le rôle DHCP et les outils de gestion
powershell
Install-WindowsFeature -Name DHCP -IncludeManagementTools

Autoriser le serveur DHCP dans Active Directory
powershell
Add-DhcpServerInDC -DnsName "NomDuServeurDHCP.example.com" -IPAddress "192.168.1.10"

Ajouter une nouvelle étendue DHCP
powershell
Add-DhcpServerv4Scope `
    -Name "MainScope" `
    -StartRange 192.168.1.10 `
    -EndRange 192.168.1.254 `
    -SubnetMask 255.255.255.0 `
    -LeaseDuration 1.00:00:00
    
Configurer les options de l'étendue DHCP
Ajouter une passerelle par défaut (routeur)
powershell
Set-DhcpServerv4OptionValue `
    -ScopeId 192.168.1.0 `
    -Router 192.168.1.1
    
Ajouter des serveurs DNS
powershell
Set-DhcpServerv4OptionValue `
    -ScopeId 192.168.1.0 `
    -DnsServer 192.168.1.1
