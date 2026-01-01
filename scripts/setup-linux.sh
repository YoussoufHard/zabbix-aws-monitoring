#!/bin/bash
sudo apt update
sudo apt install zabbix-agent -y
sudo sed -i "s/^Server=.*/Server=10.0.1.6/" /etc/zabbix/zabbix_agentd.conf
sudo sed -i "s/^ServerActive=.*/ServerActive=10.0.1.6/" /etc/zabbix/zabbix_agentd.conf
sudo sed -i "s/^Hostname=.*/Hostname=Client-Linux/" /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent