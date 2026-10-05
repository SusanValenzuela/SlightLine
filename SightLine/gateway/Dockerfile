FROM rust:1-bookworm AS builder
WORKDIR /app
COPY Cargo.toml ./
COPY src ./src
RUN cargo build --release

FROM debian:bookworm-slim
RUN useradd --create-home appuser
WORKDIR /app
COPY --from=builder /app/target/release/sightline-gateway /app/gateway
USER appuser
EXPOSE 8080
CMD ["/app/gateway"]
