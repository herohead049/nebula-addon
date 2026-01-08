FROM alpine:3.19
RUN apk add --no-cache ca-certificates
#ADD https://github.com/slackhq/nebula/releases/download/v1.9.6/nebula-linux-amd64 /usr/local/bin/nebula
ADD https://github.com/slackhq/nebula/releases/download/v1.9.6/nebula-linux-amd64.tar.gz /usr/local/
#ADD https://github.com/slackhq/nebula/releases/download/v1.9.6/nebula-cert-linux-amd64 /usr/local/bin/nebula-cert
RUN tar -xzf /usr/local/nebula-linux-amd64.tar.gz -C /usr/local/bin
RUN chmod +x /usr/local/bin/nebula /usr/local/bin/nebula-cert
COPY nebula /etc/nebula
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]

