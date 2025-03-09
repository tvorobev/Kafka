from confluent_kafka import Producer

config = {
    'bootstrap.servers': 'localhost:9092',  # адрес Kafka сервера
    'client.id': 'simple-producer'
}

producer = Producer(**config)

def delivery_report(err, msg):
    if err is not None:
        print(f"Message delivery failed: {err}")
    else:
        print(f"Message delivered to {msg.topic()} [{msg.partition()}] at offset {msg.offset()}")

def send_message(data):
    try:
        # Асинхронная отправка сообщения
        producer.produce('test_topic_json', data.encode('utf-8'), callback=delivery_report)
        producer.poll(0)  # Поллинг для обработки обратных вызовов
    except BufferError:
        print(f"Local producer queue is full ({len(producer)} messages awaiting delivery): try again")

if __name__ == '__main__':
    send_message('{"GoodsID": 456,'
                 '"SKUID": 789}')
    producer.flush()