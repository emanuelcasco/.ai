---
title: API Documentation
type: template
---

# {{Project Name}} - API Documentation

- Last updated: {{date}}

## 📘 General Notes

[[LLM: Describe the API in a few sentences. Use logical grouping of endpoints by sections. Copy the template block for each endpoint. Replace `METHOD`, `PATH`, `PARAMETERS`, `RESPONSES`, and `EXAMPLES`.  Group logically (e.g., Create, Read, Update, Delete).]]

<<REPEAT: section>>

## {{Section Emoji, like:🧱}} {{Section Name}}

[[LLM: Describe the section in a few sentences.]]

<<REPEAT: endpoint>>

### {{Endpoint Name}}

[[LLM: Describe the endpoint in a few sentences.]]

<details>
  <summary><code>POST <b>/resource</b></code></summary>

Creates a new resource

**Parameters**

[[LLM: Provide the parameters for the endpoint.]]

> | name   | type     | data type | description                   |
> | ------ | -------- | --------- | ----------------------------- |
> | `name` | required | string    | Name of the new resource      |
> | `type` | optional | string    | Type/category of the resource |

**Responses**

[[LLM: Provide the responses for the endpoint.]]

> | http code | content-type       | response                       |
> | --------- | ------------------ | ------------------------------ |
> | `201`     | `application/json` | `{ "id": "abc123", ... }`      |
> | `400`     | `application/json` | `{ "error": "Invalid input" }` |

**Example cURL**

[[LLM: Provide an example cURL for the endpoint.]]

> ```bash
> curl -X POST -H "Content-Type: application/json" \
>   --data '{"name":"Test","type":"example"}' http://localhost:PORT/resource
> ```

**Example Payload (Nested JSON)**

[[LLM: Provide an example payload for the endpoint.]]

> ```json
> {
>   "name": "Test Resource",
>   "type": "example",
>   "metadata": {
>     "createdBy": "admin",
>     "tags": ["tag1", "tag2"]
>   }
> }
> ```

**Example Response (Nested JSON)**

[[LLM: Provide an example response for the endpoint.]]

> ```json
> {
>   "id": "abc123",
>   "name": "Test Resource",
>   "type": "example",
>   "metadata": {
>     "createdBy": "admin",
>     "tags": ["tag1", "tag2"]
>   },
>   "createdAt": "2025-06-15T10:00:00Z"
> }
> ```

<</REPEAT>>

</details>

<</REPEAT>>
