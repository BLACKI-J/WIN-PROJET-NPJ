Commandes PowerShell

Installer le rôle DNS et les outils de gestion
powershell
Install-WindowsFeature -Name DNS -IncludeManagementTools

Créer une zone DNS
Créer une zone principale
powershell
Add-DnsServerPrimaryZone -Name "example.com" -ReplicationScope "Domain"

Ajouter des enregistrements DNS
Ajouter un enregistrement A
powershell
Add-DnsServerResourceRecordA -ZoneName "example.com" -Name "www" -IPv4Address "192.168.1.100"

Ajouter un enregistrement CNAME
powershell
Add-DnsServerResourceRecordCName -ZoneName "example.com" -Name "alias" -HostNameAlias "www.example.com"

Ajouter un enregistrement MX
powershell
Add-DnsServerResourceRecordMX -ZoneName "example.com" -MailExchange "mail.
