# Configuration Zabbix

## Ajout des hôtes dans Zabbix

Après le déploiement du serveur Zabbix et l'installation des agents sur les machines clientes, chaque hôte doit être déclaré dans l'interface d'administration pour activer la supervision.

### Ajout du client Linux
1. Accédez à l'interface Web Zabbix.
2. Allez dans le menu **Data Collection → Hosts**.
3. Cliquez sur **Create host**.
4. Configurez l'hôte :
   - **Host name** : Client-Linux
   - **Groups** : Linux servers
   - **Interfaces** : Ajoutez une interface de type Zabbix agent avec l'adresse IP privée du client Linux.
5. Appliquez le template **Template OS Linux by Zabbix agent** en cliquant sur **Add** dans la section Templates.
6. Sauvegardez les modifications.

Après quelques instants, l'agent devrait apparaître avec le statut **Available**, confirmant une communication réussie entre le serveur Zabbix et le client Linux.

### Ajout du client Windows
1. Répétez les étapes similaires pour le client Windows.
2. Utilisez le groupe **Windows servers**.
3. Appliquez le template **Template OS Windows by Zabbix agent**.
4. Vérifiez que le statut passe à **Available**.

## Collecte et affichage des métriques

Une fois les hôtes configurés, Zabbix commence automatiquement la collecte des métriques système à partir des agents installés.

Les principales données supervisées incluent :
- **Utilisation du processeur (CPU)**
- **Utilisation de la mémoire (RAM)**
- **Espace disque disponible**
- **Charge système**
- **Disponibilité réseau**

Ces informations sont consultables via le menu **Monitoring → Hosts → Latest data**, permettant une visualisation détaillée et en temps réel de l'état des machines supervisées.

## Tableaux de bord de supervision

Zabbix propose des tableaux de bord dynamiques pour visualiser les métriques sous forme graphique.

Un tableau de bord typique affiche :
- L'état de disponibilité des hôtes
- L'utilisation du CPU et de la mémoire
- L'occupation des disques

Ces tableaux de bord facilitent l'analyse globale de l'infrastructure supervisée et permettent une détection rapide des anomalies.

Accès : **Monitoring → Dashboard**

## Détection des anomalies et alertes

Zabbix intègre un système de déclencheurs (triggers) pour détecter automatiquement des situations anormales, telles que :
- Une surcharge du processeur
- Un manque d'espace disque
- L'indisponibilité d'un agent

Les alertes générées sont consultables dans le menu **Monitoring → Problems**.

**Note :** Certaines alertes peuvent être liées à des services spécifiques à AWS EC2 et peuvent être ignorées pour la supervision de base.

## Validation du fonctionnement

Les résultats obtenus démontrent que :
- Le serveur Zabbix est opérationnel
- Les agents Linux et Windows communiquent correctement avec le serveur
- Les métriques sont collectées, analysées et visualisées en temps réel

La solution mise en place répond ainsi aux objectifs de supervision définis.