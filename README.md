# ClickHouse Helm Chart

Fully functioning replicated ClickHouse environment. Client and Tabix UI included. By default there are 2 replicas.

It's also important to create replicated tables correctly, you may check sample schema in `sample-schema.sql`, which you have to execute on each node.

## Run

```bash
helm install -f values.yaml --name ch --namespace=default ./clickhouse
```

## Client

Log into container:

```bash
kubectl exec -it $(kubectl get pod -l app=clickhouse-client -o jsonpath="{.items[0].metadata.name}") -- /bin/bash
```

Connect to CH node:

```bash
/usr/bin/clickhouse-client --host clickhouse-0.clickhouse.default.svc.cluster.local
```

## Tabix UI

This chart includes [tabix.io](https://tabix.io/) as UI if you need it.

## Build Docker image

```bash
docker build -t clickhouse-server ./clickhouse/docker
```