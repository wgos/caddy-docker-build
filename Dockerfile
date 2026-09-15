ARG CADDY_VERSION=2.11
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/mholt/caddy-l4 \
    --with github.com/fvbommel/caddy-combine-ip-ranges \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
