# Alma Relay on Railway: the official image (ghcr.io/yetone/alma-relay:1.4.0, MIT), unmodified.
# Only change: listen dual-stack ([::]) on $PORT (Railway injects 8080) so Railway's edge, healthcheck and private
# network (IPv6) all reach it. Railway terminates HTTPS; Caddy and coturn are not needed/possible
# (Railway has no UDP, so the phone's live browser view via TURN is unavailable).
# RELAY_REGISTRATION_KEY (generated per deploy by the template) keeps strangers from parking tunnels.
FROM ghcr.io/yetone/alma-relay:1.4.0@sha256:f86e5fa0729d35819c4acac34a775dea47dd012e81c95bd3ee8be5876029e473
ENV HOST=:: \
    PORT=8080
EXPOSE 8080
