use axum::{http::StatusCode, routing::{get, post}, Json, Router};
use serde_json::{json, Value};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let app = Router::new()
        .route("/health", get(health))
        .route("/api/describe", post(describe));
    let listener = tokio::net::TcpListener::bind("0.0.0.0:8080").await?;
    println!("SightLine gateway listening on port 8080");
    axum::serve(listener, app).await?;
    Ok(())
}

async fn health() -> Json<Value> {
    Json(json!({"status": "ok", "service": "gateway", "inference_ready": false}))
}

async fn describe() -> (StatusCode, Json<Value>) {
    // TODO: validate an image and route it to the private AI service.
    (StatusCode::NOT_IMPLEMENTED, Json(json!({
        "detail": "Image routing and AI inference are not implemented yet."
    })))
}
