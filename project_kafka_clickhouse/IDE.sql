drop table if exists test_kafka;
create table test_kafka
(
    message String
)
    engine = Kafka
    SETTINGS kafka_broker_list = '192.168.1.149:29092'
        , kafka_topic_list = 'test_topic'
        , kafka_group_name = 'my-group2'
        , kafka_format = 'LineAsString'
        , kafka_max_block_size = 2097152
;

create table message
(
    message String
)
engine = MergeTree
order by message
;


create materialized view test_kafka_view
TO default.message
            (
             `message` String
                )
AS
SELECT message
FROM test_kafka
;

select * from message;