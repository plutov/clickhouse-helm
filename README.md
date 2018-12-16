# ClickHouse Helm Chart

Fully functioning replicated ClickHouse environment. Client and Tabix UI included.

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

[localhost:8089](http://localhost:8089)

## Build Docker image

```bash
docker build -t clickhouse-server ./clickhouse/docker
```