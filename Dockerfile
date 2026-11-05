FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    libpq5 \
    libssl3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY BricouliAPI /app/BricouliAPI
COPY config.ini /app/config.ini
RUN chmod +x /app/BricouliAPI

EXPOSE 8080

# تشغيل التطبيق مع التقاط أي رسالة خطأ صريحة
CMD ["./BricouliAPI"]
