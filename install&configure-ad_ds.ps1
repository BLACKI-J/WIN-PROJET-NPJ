Installer le rôle AD DS et les outils de gestion

powershell
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools


Importer le module AD DS Deployment
powershell
Copier le code
Import-Module ADDSDeployment


Promouvoir le serveur en contrôleur de domaine

Pour créer une nouvelle forêt

powershell
Install-ADDSForest `
    -DomainName "example.com" `
    -DomainNetbiosName "EXAMPLE" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "VotreMotDePasse" -AsPlainText -Force) `
    -InstallDNS `
    -Force


Pour ajouter un contrôleur de domaine à un domaine existant

powershell

Copier le code
Install-ADDSDomainController `
    -DomainName "example.com" `
    -Credential (Get-Credential) `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "VotreMotDePasse" -AsPlainText -Force) `
    -InstallDNS `
    -Force


Détails des Commandes
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools : Installe le rôle AD DS et les outils de gestion.
Import-Module ADDSDeployment : Importe le module nécessaire pour utiliser les commandes de déploiement AD DS.
Install-ADDSForest : Promeut le serveur en tant que premier contrôleur de domaine dans une nouvelle forêt.
-DomainName : Spécifie le nom du domaine.
-DomainNetbiosName : Spécifie le nom NetBIOS du domaine.
-SafeModeAdministratorPassword : Définit le mot de passe pour l'administrateur en mode sans échec.
-InstallDNS : Installe le rôle DNS.
-Force : Force l'exécution sans demande de confirmation.
Install-ADDSDomainController : Ajoute un contrôleur de domaine à un domaine existant.
-DomainName : Spécifie le nom du domaine.
-Credential : Spécifie les informations d'identification d'un administrateur du domaine.
-SafeModeAdministratorPassword : Définit le mot de passe pour l'administrateur en mode sans échec.
-InstallDNS : Installe le rôle DNS.
-Force : Force l'exécution sans demande de confirmation.
Exemple complet pour une nouvelle forêt
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
Exemple complet pour ajouter un contrôleur de domaine à un domaine existant
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
