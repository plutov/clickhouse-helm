CREATE TABLE IF NOT EXISTS clicks_sharded (
    date Date DEFAULT toDate(request_time),
    request_time DateTime DEFAULT now(),
    id String,
    advertiser String,
    network String,
    publisher String,
    offer String,
    campaign String,
    sub_id String,
    click_ip String,
    referer String,
    user_agent String,
    device_id String,
    country String,
    city String,
    browser_language String,
    campaign_type String,
    revenue String,
    payout String
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/default/clicks_sharded', '{replica}', date, (date, id), 8192);
CREATE TABLE IF NOT EXISTS clicks AS clicks_sharded
ENGINE = Distributed( clicks_cluster, default, clicks_sharded , rand() );