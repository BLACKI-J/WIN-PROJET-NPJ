Pour installer le rôle AD DS (Active Directory Domain Services) sur un serveur Windows via PowerShell, vous pouvez suivre ces étapes :

Étape 1: Installer le rôle AD DS
Utilisez la commande Install-WindowsFeature pour installer le rôle AD DS.

powershell
Copier le code
# Installer le rôle AD DS et les outils de gestion
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Étape 2: Promouvoir le serveur en contrôleur de domaine
Après avoir installé le rôle AD DS, vous devez promouvoir le serveur en contrôleur de domaine. Vous pouvez soit créer une nouvelle forêt, soit ajouter un contrôleur de domaine à un domaine existant.

Créer une nouvelle forêt AD
powershell
Copier le code
# Importer le module ADDSDeployment
Import-Module ADDSDeployment

# Promouvoir le serveur en tant que premier contrôleur de domaine dans une nouvelle forêt
Install-ADDSForest `
    -DomainName "example.com" `
    -DomainNetbiosName "EXAMPLE" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "VotreMotDePasse" -AsPlainText -Force) `
    -InstallDNS `
    -Force
Ajouter un contrôleur de domaine à un domaine existant
powershell
Copier le code
# Importer le module ADDSDeployment
Import-Module ADDSDeployment

# Promouvoir le serveur en tant que contrôleur de domaine dans un domaine existant
Install-ADDSDomainController `
    -DomainName "example.com" `
    -Credential (Get-Credential) `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "VotreMotDePasse" -AsPlainText -Force) `
    -InstallDNS `
    -Force
Explication des paramètres :
DomainName : Le nom DNS du domaine.
DomainNetbiosName : Le nom NetBIOS du domaine.
SafeModeAdministratorPassword : Le mot de passe pour le compte administrateur en mode sans échec.
InstallDNS : Indique que le rôle DNS sera également installé.
Credential : Les informations d'identification d'un compte administrateur du domaine (utilisé lors de l'ajout d'un contrôleur de domaine à un domaine existant).
Force : Force l'exécution de la commande sans demander de confirmation supplémentaire.
Exemple complet
Installation du rôle AD DS et promotion en nouveau domaine :
powershell
Copier le code
# Installer le rôle AD DS et les outils de gestion
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Importer le module ADDSDeployment
Import-Module ADDSDeployment

# Promouvoir le serveur en tant que premier contrôleur de domaine dans une nouvelle forêt
Install-ADDSForest `
    -DomainName "example.com" `
    -DomainNetbiosName "EXAMPLE" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "VotreMotDePasse" -AsPlainText -Force) `
    -InstallDNS `
    -Force
Installation du rôle AD DS et ajout à un domaine existant :
powershell
Copier le code
# Installer le rôle AD DS et les outils de gestion
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Importer le module ADDSDeployment
Import-Module ADDSDeployment

# Promouvoir le serveur en tant que contrôleur de domaine dans un domaine existant
Install-ADDSDomainController `
    -DomainName "example.com" `
    -Credential (Get-Credential) `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "VotreMotDePasse" -AsPlainText -Force) `
    -InstallDNS `
    -Force
Ces commandes vous permettront d'installer le rôle AD DS et de promouvoir le serveur en contrôleur de domaine pour une nouvelle forêt ou un domaine existant. Assurez-vous d'exécuter PowerShell en tant qu'administrateur et de remplacer les valeurs des paramètres par celles appropriées pour votre environnement.
