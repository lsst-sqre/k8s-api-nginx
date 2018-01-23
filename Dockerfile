FROM        nginx
MAINTAINER  sqre-admin
LABEL       description="SSL termination and proxy for SQuaRE microservices" \
            name="lsstsqre/k8s-api-nginx"
ARG         VERSION="0.0.4"
LABEL       version="$VERSION"
COPY        nginx.conf /
COPY        entrypoint.sh /
RUN         chmod 0755 /entrypoint.sh
RUN         mkdir /www
RUN         printf "OK\n" > /www/index.html
EXPOSE      80 443
ENTRYPOINT  ["/entrypoint.sh"]
