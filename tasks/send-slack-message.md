---
title: Send Slack Message
type: task
mode: execute
---

If asked to send a Slack message, use the `sms` tool (or send_slack_message.sh script) to send the message.

## Basic Usage

Example:

```bash
sms "<CHANNEL_ID>" "<MESSAGE_TEXT>"
```

Where:

- `<CHANNEL_ID>`: (required) The required Slack channel ID
- `<MESSAGE_TEXT>`: (required) The required message content (enclose in quotes if it contains spaces)

## Usage Examples

Send a basic message:

```bash
sms "C1234567890" "Hello team! The deployment is complete."
```

## Error Handling

- If no channel ID is provided, return an error message
- If no message text is provided, return an error message
