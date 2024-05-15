Commandes PowerShell
Installer le rôle DHCP et les outils de gestion
Sur le serveur principal (et répétez cette étape sur le serveur partenaire) :

powershell
Install-WindowsFeature -Name DHCP -IncludeManagementTools
Autoriser les serveurs DHCP dans Active Directory
Sur chaque serveur :

powershell
Add-DhcpServerInDC -DnsName "NomDuServeurDHCPPrincipal.example.com" -IPAddress "192.168.1.10"
Add-DhcpServerInDC -DnsName "NomDuServeurDHCPPartenaire.example.com" -IPAddress "192.168.1.11"
Ajouter une nouvelle étendue DHCP sur le serveur principal
Sur le serveur principal :

powershell
Add-DhcpServerv4Scope `
    -Name "MainScope" `
    -StartRange 192.168.1.100 `
    -EndRange 192.168.1.200 `
    -SubnetMask 255.255.255.0 `
    -LeaseDuration 1.00:00:00

# Ajouter une passerelle par défaut (routeur)
Set-DhcpServerv4OptionValue `
    -ScopeId 192.168.1.0 `
    -Router 192.168.1.1

# Ajouter des serveurs DNS
Set-DhcpServerv4OptionValue `
    -ScopeId 192.168.1.0 `
    -DnsServer 192.168.1.1,8.8.8.8


Configurer le basculement DHCP entre les serveurs
Sur le serveur principal :

Exemple de configuration en mode LoadBalance
powershell
Add-DhcpServerv4Failover `
    -Name "DHCP-Failover" `
    -ScopeId 192.168.1.0 `
    -PartnerServer "NomDuServeurDHCPPartenaire.example.com" `
    -Mode LoadBalance `
    -LoadBalancePercent 50 `
    -SharedSecret "SecretPartagé"
    
Exemple de configuration en mode HotStandby
powershell
Add-DhcpServerv4Failover `
    -Name "DHCP-Failover" `
    -ScopeId 192.168.1.0 `
    -PartnerServer "NomDuServeurDHCPPartenaire.example.com" `
    -Mode HotStandby `
    -ReservePercent 5 `
    -StateSwitchInterval 600 `
    -SharedSecret "SecretPartagé"

Exemple complet
Voici un exemple complet pour configurer le basculement DHCP en mode LoadBalance entre deux serveurs DHCP :

Installer le rôle DHCP sur les deux serveurs :
Sur le serveur principal et le serveur partenaire :

powershell
Install-WindowsFeature -Name DHCP -IncludeManagementTools
Autoriser les serveurs DHCP dans Active Directory :
Sur chaque serveur :

powershell
Add-DhcpServerInDC -DnsName "NomDuServeurDHCPPrincipal.example.com" -IPAddress "192.168.1.10"
Add-DhcpServerInDC -DnsName "NomDuServeurDHCPPartenaire.example.com" -IPAddress "192.168.1.11"
Ajouter une nouvelle étendue DHCP sur le serveur principal :
Sur le serveur principal :

powershell
Add-DhcpServerv4Scope `
    -Name "MainScope" `
    -StartRange 192.168.1.100 `
    -EndRange 192.168.1.200 `
    -SubnetMask 255.255.255.0 `
    -LeaseDuration 1.00:00:00

Set-DhcpServerv4OptionValue `
    -ScopeId 192.168.1.0 `
    -Router 192.168.1.1

Set-DhcpServerv4OptionValue `
    -ScopeId 192.168.1.0 `
    -DnsServer 192.168.1.1,8.8.8.8
Configurer le basculement DHCP en mode LoadBalance :
Sur le serveur principal :

powershell
Add-DhcpServerv4Failover `
    -Name "DHCP-Failover" `
    -ScopeId 192.168.1.0 `
    -PartnerServer "NomDuServeurDHCPPartenaire.example.com" `
    -Mode LoadBalance `
    -LoadBalancePercent 50 `
    -SharedSecret "SecretPartagé"
Vérification
Pour vérifier que le basculement DHCP a été correctement configuré, utilisez les commandes suivantes :

Vérifier la configuration de basculement DHCP
powershell
Copier le code
Get-DhcpServerv4Failover
Vérifier les détails du basculement pour une étendue spécifique
powershell
Copier le code
Get-DhcpServerv4FailoverScope -ScopeId 192.168.1.0
