# SightLine

Susan Valenzuela's capstone: an accessible mobile app that will turn camera images into spoken scene descriptions for visually impaired users.

## Starter status

This is the project foundation, not a working vision assistant. Flutter contains an accessible welcome screen. Rust and Python expose health endpoints and explicit `501 Not Implemented` description endpoints. No camera capture, AI model, speech, image storage, or AWS deployment is implemented yet.

## Repository layout

| Folder | Purpose |
| --- | --- |
| `mobile/` | Flutter mobile app source |
| `gateway/` | Rust/Axum public API foundation |
| `ai-service/` | Python/FastAPI inference service foundation |
| `docs/` | Architecture, API contract, and milestones |
| `infra/` | Future AWS deployment configuration |

The GitHub repository is named `SlightLine`; the app/project name is **SightLine**.

## Run the backend locally

Install Docker Desktop, then run from the repository root:

```sh
docker compose up --build
```

Check `http://localhost:8080/health` (gateway), `http://localhost:8000/health` (AI service), and `http://localhost:8000/docs` (AI API documentation). Both health endpoints return HTTP 200; this means the process runs, not that inference is ready. Stop with `docker compose down`.

## Run Flutter

Install the Flutter stable SDK and Android Studio, then run:

```sh
cd mobile
flutter create --project-name sightline --platforms android,ios .
flutter pub get
flutter analyze
flutter test
flutter run
```

The first command generates native platform projects around the committed Dart starter. Keep `lib/main.dart` and `test/widget_test.dart` from this repo if your Flutter version replaces them. Android runs on Windows; building iOS requires macOS and Xcode. Camera permissions will be added with camera capture.

## Run services without Docker

Python 3.12+:

```sh
cd ai-service
python -m venv .venv
# Windows PowerShell: .venv\Scripts\Activate.ps1
# macOS/Linux: source .venv/bin/activate
python -m pip install -r requirements.txt
python -m uvicorn app.main:app --reload --port 8000
```

Rust stable, in another terminal:

```sh
cd gateway
cargo run
```

## Next milestones

1. Generate and commit Flutter platform folders; run the app on Android.
2. Add accessible camera capture, permission handling, and haptic feedback.
3. Select a Hugging Face vision model and implement Python inference.
4. Forward validated image requests through Rust to Python.
5. Speak descriptions using native text-to-speech; handle loading and failures.
6. Measure latency, test accessibility, then deploy to AWS.

See [architecture](docs/architecture.md) and [API contract](docs/api.md).
