# Multi-stage Dockerfile for Revive Adserver v5.5.2
# Stage 1: Download and prepare Revive Adserver
FROM alpine:3.19 AS downloader

ARG REVIVE_VERSION=5.5.2

RUN apk add --no-cache wget tar

WORKDIR /tmp
RUN wget -qO- "https://raw.githubusercontent.com/codions/revive-adserver/refs/heads/builds/downloads/revive-adserver-${REVIVE_VERSION}.tar.gz" | tar xz --strip 1

# Stage 2: Production image
FROM alpine:3.19

# Environment variables
ARG APP_ENV=production
ARG DOCKERIZE_VERSION=v0.7.0

LABEL maintainer="Fábio Assunção fabio@codions.com"
LABEL description="Revive Adserver v5.5.2 with Nginx, PHP 8.1-FPM on Alpine Linux"


# Install system dependencies
RUN apk add --no-cache \
    nginx \
    php81 \
    php81-fpm \
    php81-cli \
    php81-ctype \
    php81-curl \
    php81-dom \
    php81-fileinfo \
    php81-gd \
    php81-iconv \
    php81-json \
    php81-mbstring \
    php81-mysqli \
    php81-opcache \
    php81-openssl \
    php81-pdo \
    php81-pdo_mysql \
    php81-pecl-redis \
    php81-session \
    php81-simplexml \
    php81-tokenizer \
    php81-xml \
    php81-xmlreader \
    php81-xmlwriter \
    php81-zip \
    supervisor \
    wget \
    tzdata \
    netcat-openbsd

# Create php symlink for compatibility
RUN ln -sf /usr/bin/php81 /usr/bin/php

# Create nginx user and www-data group if not exists
RUN addgroup -S www-data 2>/dev/null || true && \
    adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G www-data nginx 2>/dev/null || true

# Set working directory
WORKDIR /var/www/html

# Copy Revive Adserver files from downloader stage
COPY --from=downloader /tmp/ /var/www/html/
RUN chown -Rf nginx:www-data /var/www/html

# Remove default nginx configuration first
RUN rm -f /etc/nginx/http.d/default.conf

# Copy configuration files
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/default.conf /etc/nginx/http.d/default.conf
COPY docker/php/php.ini /etc/php81/php.ini
COPY docker/php/www.conf /etc/php81/php-fpm.d/www.conf
COPY docker/supervisor.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker/supervisor.d/schedule.conf /etc/supervisor/conf.d/schedule.conf

# Copy scripts
COPY docker/scripts/ /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint && \
    chmod +x /usr/local/bin/start && \
    chmod +x /usr/local/bin/schedule

# Install dockerize for waiting for dependencies
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# Create necessary directories (logs go to stdout/stderr, no log dirs needed)
RUN mkdir -p /var/cache/nginx \
    /var/tmp/nginx \
    /run/nginx \
    /run/php-fpm81 \
    /var/www/html/var/cache \
    /var/www/html/var/plugins \
    /var/www/html/www/images \
    /var/www/html/www/delivery

# Set proper permissions
RUN chown -R nginx:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/var \
    && chmod -R 777 /var/www/html/www/images \
    && chmod -R 777 /var/www/html/www/delivery \
    && chown -R nginx:www-data /var/cache/nginx \
    && chown -R nginx:www-data /run/nginx

# Test nginx configuration
RUN nginx -t

# Expose ports
EXPOSE 80

# Set entrypoint and command
ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["/usr/local/bin/start"]