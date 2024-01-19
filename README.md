# Project Name
Step Project 1

 ## Descrition
 All services will automatically downloadded and installed, one that you must do it`s create file alertmanager.yml in directore /StepProject1/Vm1.
 Example of alertmanager.yml is alertmanager-example.yml, just put your variables

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
