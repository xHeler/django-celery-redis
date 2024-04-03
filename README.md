# Django Celery Redis
This is an simple exampel how to use Django and Celery via Redis. Application simulate sending email with 3 secound delay.

# How to run this application?
```bash
docker compose up -d --build
```
# Logging
Django web server:
```bash
docker compose logs -f web
```

Celery:
```bash
docker compose logs -f celery
```