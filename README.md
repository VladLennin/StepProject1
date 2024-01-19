# Project Name
Step Project 1

 ## Descrition
 All services will automatically downloadded and installed, one that yopu must to do its change variables in file: /StepProject1/VM1/alertmanager.yml
 
## Services VM1
 - Grafana: host:33010
 - Prometheus: host:33020
 - AlertManager: host:33030
 - NodeExporter: host:33040

 ## Services VM2
 - NodeExporter: host:33070
 - MySqlExporter: host:33090
 - MySql: closed port



## Installation
```bash
# Example Installation Steps
git clone https://github.com/VladLennin/StepProject1.git
cd StepProject1
./recreate-machines.sh
