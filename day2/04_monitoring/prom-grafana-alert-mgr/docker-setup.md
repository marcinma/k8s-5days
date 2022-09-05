```/etc/docker/daemon.json
{
  "metrics-addr" : "127.0.0.1:9323",
  "experimental" : true
}
```
sudo service docker restart


http://localhost:3000
Configure data source as: http://prometheus:9090
https://grafana.com/grafana/dashboards/893
https://grafana.com/grafana/dashboards/3662