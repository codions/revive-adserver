FROM codions/php:7.4-nginx

LABEL maintainer="Fábio Assunção fabio@codions.com"

ENV APP_ENV=production
ENV DOCKERIZE_VERSION v0.6.1

WORKDIR /usr/share/nginx/html

# Supervisor config
COPY .docker/supervisor.d/* /etc/supervisor.d/

# Override nginx's default config
COPY .docker/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY .docker/scripts /usr/deploy/scripts

RUN chmod +x /usr/deploy/scripts/entrypoint && \
    chmod +x /usr/deploy/scripts/start && \
    chmod +x /usr/deploy/scripts/schedule

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN wget -qO- https://download.revive-adserver.com/revive-adserver-5.5.1.tar.gz | tar xz --strip 1 \
    && chown -Rf nginx.nginx .

# Expose webserver port
EXPOSE 80 9001

# Set a custom entrypoint to allow for privilege dropping and one-off commands
ENTRYPOINT ["/usr/deploy/scripts/entrypoint"]

# Set default command to launch the all-in-one configuration supervised by supervisord
CMD ["/usr/deploy/scripts/start"]