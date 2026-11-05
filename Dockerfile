FROM ubuntu:22.04

# Install runtime dependencies for PostgreSQL (libpq) and OpenSSL
RUN apt-get update && apt-get install -y \
    libpq5 \
    libssl3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the compiled Linux executable
COPY BricouliAPI /app/BricouliAPI
RUN chmod +x /app/BricouliAPI

# Expose the port your API listens on (check your Config.Port)
EXPOSE 8080

CMD ["./BricouliAPI"]