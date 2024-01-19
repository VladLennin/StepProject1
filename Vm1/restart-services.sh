sudo systemctl daemon-reload

#Enable services
sudo systemctl enable grafana-server.service
sudo systemctl enable alertmanager
sudo systemctl enable prometheus
sudo systemctl enable node_exporter

#Start services
sudo systemctl start grafana-server
sudo systemctl start alertmanager
sudo systemctl start prometheus
sudo systemctl start node_exporter

#Show statuses
sudo systemctl status grafana-server
sudo systemctl status alertmanager
sudo systemctl status prometheus
sudo systemctl status node_exporter








