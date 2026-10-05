# Architecture

## Intended MVP

Flutter camera capture → Rust/Axum validation and routing → Python/FastAPI vision model → text response → Flutter native text-to-speech and haptics.

The starter contains only the Flutter welcome screen and independent service health/stub routes. It does not connect these components yet.

## Planned deployment

AWS API Gateway in front of a containerized Rust gateway on ECS; Python inference runs as a private containerized service. Choose CPU/GPU hosting after measuring the selected model. S3 storage is optional, not part of the current scaffold. No AWS resources or costs are created by this repository.

## Goals to measure

- Accessible gesture capture and screen-reader operation.
- Rust routing under 1 second.
- Capture-to-spoken-output under 3 seconds, subject to model/hardware measurement.
- Haptic success and error feedback.

## Later stretch goals

Continuous camera mode, distance estimation, and separate room/text/hazard prompts. Descriptions are assistive information; they should not claim that a route is safe.
