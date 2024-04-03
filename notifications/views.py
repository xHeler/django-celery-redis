import json
from django.http import JsonResponse
from .tasks import fake_send_email_task


def send_email_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        subject = data.get('subject')
        message = data.get('message')
        recipient_list = data.get('recipients')

        task = fake_send_email_task.delay(subject, message, recipient_list)
        return JsonResponse({'task_id': task.id})
    else:
        return JsonResponse({'error': 'Invalid request method'})
