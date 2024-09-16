# kafka
памятка Apache Kafka, структура:
* docker_kafka_clickhouse - необходимое для поднятия в докере кафки без аутентификации + clickhouse
* docker_with_sasl - необходимое для поднятия в докере кафки с SASL аутентификацией
* docker_without_sasl - необходимое для поднятия в докере кафки без аутентификации
* project_kafka_clickhouse - sql файл с созданием таблицы с движком Kafka, продьюсера используем обычного без SASL
* project_with_sasl - producer, consumer с SASL
* project_without_sasl - producer, consumer без SASL

полезные ссылки:
* [брокеры сообщений](https://habr.com/ru/companies/sberbank/articles/669456/)
* [Основы технологии Kafka](https://habr.com/ru/companies/slurm/articles/550934/)
* [Apache Kafka: установка, основы и интеграция](https://www.yourtodo.ru/posts/apache-kafka-ustanovka-osnovyi-i-integratsiya/)
* [Программа Offset Explorer](https://kafkatool.com/)
* [расширенный курс по Apache Kafka](https://www.youtube.com/playlist?list=PL8D2P0ruohOC5FXjzqVRaTsglQ57iKCCe)
