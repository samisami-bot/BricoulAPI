FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    libpq5 \
    ca-certificates \
    wget \
    && rm -rf /var/lib/apt/lists/*

# تثبيت OpenSSL 1.1 المطلوب لمكتبة Indy في Lazarus (لأن Ubuntu 22.04 يفتقر له افتراضياً)
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
    dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
    rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb

WORKDIR /app

COPY BricouliAPI /app/BricouliAPI
COPY config.ini /app/config.ini
RUN chmod +x /app/BricouliAPI

EXPOSE 8080

# تشغيل التطبيق
CMD ["./BricouliAPI"]