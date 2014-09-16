Elasticsearch-Fluentd-Kibana ENV
===============

A preset docker for Elasticsearch-Fluentd-Kibana development

Prerequisite
===============
Forward ports from VM (if need) to local host

Ports are listed in fig.yml

Run
===============
```sh
cd docker
fig up
```

Verify
===============

###Elasticsearch + Kibana
```
http://localhost:8003
```

###Fluentd
```
http://localhost:8002

username = admin
password = changeme
```
**Remember to start Fluentd service in the panel before using Flentd agent.**

###Logging Flow

ssh into your docker host instance(docker-osx/boot2docker) and

```sh
curl -X POST -d 'json={"123456":"awesome"}' "http://localhost:8888/aftership.log"
curl -X POST -d 'json={"key":"value"}' "http://localhost:8888/aftership.log"
...
```

Then wait fluentd to flush buffer. After a while, you will see records in Kibana


