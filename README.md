# ClickHouse Helm Chart

Fully functioning replicated ClickHouse environment. CLI, Graphite and Tabix UI included. By default there are 2 replicas.

It's also important to create replicated tables correctly, you may check sample schema in `sample-schema.sql`, which you have to execute on each node (`CREATE` queries are not replicated in ClickHouse).

## Run

```bash
helm install -f ./clickhouse/values.yaml --name ch --namespace=default ./clickhouse
```

## Client

Works if `client.enabled` is `true`.

Log into container:

```bash
kubectl exec -it $(kubectl get pod -l app=clickhouse-client -o jsonpath="{.items[0].metadata.name}") -- /bin/bash
```

Connect to CH node:

```bash
/usr/bin/clickhouse-client --host clickhouse-0.clickhouse.default.svc.cluster.local
```

## Tabix UI

Works if `tabix.enabled` is `true`.

This chart includes [tabix.io](https://tabix.io/) as UI if you need it.

If LB is eanbled it will be running on localhost:8088

- name: dev
- `host:port`: `http://localhost:8123`
- login: `reader`
- password: `gFzFTUQ9`
- Enable HTTP Base Auth

## Monitoring with Graphite

Works when `graphite.enabled` is `true`.

If LB is eanbled it will be running on [http://localhost:8080/dashboard](http://localhost:8080/dashboard)

## Users

- writer / 2c82mirS
- reader / gFzFTUQ9

## Build Docker image

```bash
docker build -t clickhouse-server ./clickhouse/docker
```

## Purge

```bash
helm del --purge ch
```