#!/bin/bash

# Обновляем сертификат и ключ в контейнере
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -out ./nginx/certificates/certificate.crt \
  -keyout ./nginx/certificates/key.key \
  -subj "/C=RU/ST=Moscow/L=Moscow/O=DevOps/CN=localhost"

# Перезапускаем nginx внутри контейнера
docker exec nginx-cont nginx -s reload
