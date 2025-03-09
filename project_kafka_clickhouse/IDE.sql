--------- читаем сообщение как обычную строку

drop table if exists test_kafka;
create table test_kafka
(
    message String
)
    engine = Kafka
    SETTINGS kafka_broker_list = 'localhost:29092'
        , kafka_topic_list = 'test_topic'
        , kafka_group_name = 'my-group3'
        , kafka_format = 'LineAsString'
        , kafka_max_block_size = 2097152
;


drop table if exists message;
create table message
(
    message String
)
engine = MergeTree
order by message
;


drop view if exists test_kafka_view;
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












--------- читаем JSON как обычную строку


drop table if exists test_kafka_json;
create table test_kafka_json
(
    message String
)
    engine = Kafka
    SETTINGS kafka_broker_list = 'localhost:29092'
        , kafka_topic_list = 'test_topic_json'
        , kafka_group_name = 'my-group2'
        , kafka_format = 'JSONAsString'
        , kafka_max_block_size = 2097152
;


drop table if exists message_json;
create table message_json
(
    message String
)
engine = MergeTree
order by message
;


drop view if exists test_kafka_json_view;
create materialized view test_kafka_json_view
TO default.message_json
            (
             `message` String
                )
AS
SELECT message
FROM test_kafka_json
;

select * from message_json;









--------- парсим JSON

drop table if exists test_kafka_json_parse;
create table test_kafka_json_parse
(
    GoodsID  UInt64,
    SKUID    UInt64
)
    engine = Kafka
    SETTINGS kafka_broker_list = 'localhost:29092'
        , kafka_topic_list = 'test_topic_json'
        , kafka_group_name = 'my-group4'
        , kafka_format = 'JSONEachRow'
        , kafka_max_block_size = 2097152
;

drop table if exists message_json_parse;
create table message_json_parse
(
    GoodsID  UInt64,
    SKUID UInt64
)
engine = MergeTree
order by GoodsID
;


drop view if exists test_kafka_json_parse_view;
create materialized view test_kafka_json_parse_view
TO default.message_json_parse
            (
             `GoodsID`  UInt64,
             `SKUID` UInt64
                )
AS
SELECT GoodsID, SKUID
FROM test_kafka_json_parse
;

select * from message_json_parse;
