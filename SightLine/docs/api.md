# API contract — starter

| Service | Method | Route | Current response |
| --- | --- | --- | --- |
| Gateway | GET | `/health` | 200: status, service, inference_ready=false |
| Gateway | POST | `/api/describe` | 501: detail explaining unfinished routing/inference |
| AI service | GET | `/health` | 200: status, service, inference_ready=false |
| AI service | POST | `/describe` | 501: detail explaining unfinished inference |

The description routes currently ignore input and never produce scene descriptions. Choose the image request format, size limits, model timeout, and response schema when implementing capture/inference. The AI service must be private in deployment. Docker exposes both services on localhost for development only.
