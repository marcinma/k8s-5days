http://localhost:3000
admin:admin
Configure data source as: http://prometheus:9090

Dashboard->Manage->import
https://grafana.com/grafana/dashboards/893

https://grafana.com/grafana/dashboards/3662


Remove docker stuff
```sh
docker rm -f cadvisor prometheus grafana nonet bridgenet
```