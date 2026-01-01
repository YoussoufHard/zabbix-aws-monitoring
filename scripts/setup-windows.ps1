# PowerShell script to configure Zabbix Agent on Windows
$confPath = "C:\Program Files\Zabbix Agent\zabbix_agentd.conf"
(gc $confPath) -replace "Server=.*", "Server=10.0.1.6" |
  Set-Content $confPath
(gc $confPath) -replace "ServerActive=.*", "ServerActive=10.0.1.6" |
  Set-Content $confPath
(gc $confPath) -replace "Hostname=.*", "Hostname=Client-Windows" |
  Set-Content $confPath
Start-Service "Zabbix Agent"
Set-Service "Zabbix Agent" -StartupType Automatic