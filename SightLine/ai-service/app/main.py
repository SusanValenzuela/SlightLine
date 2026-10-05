"""SightLine inference service skeleton; no model is loaded yet."""
from fastapi import FastAPI, HTTPException

app = FastAPI(title="SightLine AI Service", version="0.1.0")


@app.get("/health")
def health() -> dict:
    return {"status": "ok", "service": "ai-service", "inference_ready": False}


@app.post("/describe", status_code=501)
def describe() -> None:
    # TODO: validate image input, run the selected VLM, and return a description.
    raise HTTPException(status_code=501, detail="AI inference is not implemented yet.")
