WIN-PROJET-NPJ
PROJET ADMIN-WINDOWS-SERVEUR LP ASUR MRIT 23/24 DE NPJ

Description
Ce projet vise à configurer un serveur Windows avec les rôles et services suivants :

- Active Directory Domain Services (AD DS)
  - Dynamic Host Configuration Protocol (DHCP)
  - Domain Name System (DNS)
  - Configuration de basculement (Failover) pour DHCP
  - Chaque section ci-dessous décrit les étapes et les commandes nécessaires pour installer et configurer ces services en utilisant PowerShell.

- Prérequis
  -  Un serveur Windows configuré et accessible
  -  Droits administratifs sur le serveur
  -  PowerShell installé et accessible
  -  Scripts PowerShell fournis dans ce dépôt

Étape 1: Installation et Configuration d'Active Directory Domain Services (AD DS)
  - Script: install&configure-ad_ds.ps1
     - Description
       - Ce script installe le rôle AD DS et promeut le serveur en contrôleur de domaine.


Étape 2: Installation et Configuration de DHCP
  - Script: configure_dhcp.ps1
    - Description
        - Ce script installe le rôle DHCP, crée une étendue DHCP, et configure les options de l'étendue.


Étape 3: Configuration de Basculment DHCP
  - Script: conf_basculement.ps1
    - Description
      - Ce script configure le basculement DHCP entre deux serveurs pour assurer la haute disponibilité.

Étape 4: Installation et Configuration de DNS
  - Script: conf_DNS.ps1
    - Description
      - Ce script installe le rôle DNS, crée une zone DNS, et ajoute des enregistrements DNS.
