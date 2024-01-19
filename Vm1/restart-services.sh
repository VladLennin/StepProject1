sudo systemctl daemon-reload

sudo systemctl enable grafana-server.service
sudo systemctl enable alertmanager
sudo systemctl enable prometheus
sudo systemctl enable node_exporter

sudo systemctl start grafana-server
sudo systemctl start alertmanager
sudo systemctl start prometheus
sudo systemctl start node_exporter


sudo systemctl status grafana-server
sudo systemctl status alertmanager
sudo systemctl status prometheus
sudo systemctl status node_exporter








