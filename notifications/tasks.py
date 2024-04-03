from celery import shared_task
from django.core.mail import send_mail
from config import settings
import time


@shared_task
def fake_send_email_task(subject, message, recipient_list):
    # Simulate a delay of 3 seconds
    time.sleep(3)

    print(f"Subject: {subject}")
    print(f"Message: {message}")
    print(f"Recipients: {recipient_list}")