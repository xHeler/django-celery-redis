#!/bin/bash

# Set the API endpoint URL
API_URL="http://127.0.0.1:8000/send-email/"

# Set the email details
SUBJECT="Test Email"
MESSAGE="This is a test email sent from the bash script."
RECIPIENTS='["recipient1@example.com"]'

# Prepare the JSON payload
PAYLOAD=$(cat <<EOF
{
  "subject": "$SUBJECT",
  "message": "$MESSAGE",
  "recipients": $RECIPIENTS
}
EOF
)

# Send the POST request to the API endpoint
response=$(curl -s -X POST -H "Content-Type: application/json" -d "$PAYLOAD" "$API_URL")

# Extract the task ID from the response using sed
task_id=$(echo "$response" | jq -r '.task_id')

# Print the response and task ID
echo "Response:"
echo "$response"
echo ""
echo "Task ID: $task_id"
