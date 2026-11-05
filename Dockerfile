FROM ubuntu:22.04

# تثبيت الاعتماديات الأساسية
RUN apt-get update && apt-get install -y \
    libpq5 \
    libssl3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ الملف التنفيذي
COPY BricouliAPI /app/BricouliAPI
RUN chmod +x /app/BricouliAPI

# فتح المنفذ المطلوب
EXPOSE 8080

# تشغيل التطبيق مباشرة
CMD ["./BricouliAPI"]