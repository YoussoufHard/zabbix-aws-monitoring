# Installation et Déploiement

## Prérequis
- Instances AWS EC2 pour serveur et clients
- Docker et Docker Compose installés sur le serveur Zabbix
- Connexion SSH (Linux) et RDP (Windows)
- Clé privée pour accès SSH

## Déploiement du serveur Zabbix

### Étape 1 : Installation de Docker et Docker Compose
Sur le serveur Ubuntu Zabbix, exécutez les commandes suivantes pour installer Docker et Docker Compose :

```bash
sudo apt update
sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker
```

### Étape 2 : Lancement des conteneurs Zabbix
Le déploiement comprend trois conteneurs principaux :
- Un conteneur Zabbix Server
- Un conteneur Base de données MySQL
- Un conteneur Zabbix Web Interface

Utilisez le fichier `docker-compose.yml` fourni dans le dépôt pour lancer les services :

```bash
docker-compose up -d
```

### Étape 3 : Accès à l'interface Web
L'interface Web de Zabbix est accessible via l'adresse IP publique du serveur.

- URL : `http://<IP_PUBLIQUE_DU_SERVEUR_ZABBIX>/zabbix`
- Utilisateur : Admin
- Mot de passe : zabbix

## Installation des agents Zabbix sur les clients

### Client Linux
1. Connectez-vous au client Linux via SSH :
   ```bash
   ssh -i key-zabbix-lab.pem ubuntu@<IP_CLIENT_LINUX>
   ```

2. Installez l'agent Zabbix :
   ```bash
   sudo apt update
   sudo apt install zabbix-agent -y
   ```

3. Configurez l'agent pour se connecter au serveur Zabbix :
   Ouvrez le fichier de configuration :
   ```bash
   sudo nano /etc/zabbix/zabbix_agentd.conf
   ```
   Modifiez les lignes suivantes :
   ```
   Server=<IP_PRIVEE_SERVEUR_ZABBIX>
   ServerActive=<IP_PRIVEE_SERVEUR_ZABBIX>
   Hostname=Client-Linux
   ```

4. Redémarrez et activez l'agent :
   ```bash
   sudo systemctl restart zabbix-agent
   sudo systemctl enable zabbix-agent
   ```

5. Vérifiez que l'agent fonctionne :
   ```bash
   sudo systemctl status zabbix-agent
   ```

### Client Windows
1. Téléchargez l'agent Zabbix depuis le site officiel de Zabbix.

2. Installez l'agent sur le client Windows.

3. Configurez le fichier `zabbix_agentd.conf` avec les paramètres suivants :
   ```
   Server=<IP_PRIVEE_SERVEUR_ZABBIX>
   ServerActive=<IP_PRIVEE_SERVEUR_ZABBIX>
   Hostname=Client-Windows
   ```

4. Démarrez le service Zabbix Agent et configurez-le pour un démarrage automatique.

**Note :** Utilisez les adresses IP privées pour la configuration des agents afin d'assurer la connectivité depuis l'interface Zabbix.