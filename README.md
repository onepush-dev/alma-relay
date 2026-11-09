# Alma Relay on Railway

Alma Relay — your own relay for Alma Remote Access: reach the Alma on your desktop from the Alma app on your phone, from anywhere, end-to-end encrypted. Deploy on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/TEMPLATE_CODE)

This repository packages the official [Alma Relay](https://github.com/yetone/alma-relay) image (`ghcr.io/yetone/alma-relay:1.4.0`, MIT) for Railway. It is an independent community packaging, not affiliated with or endorsed by Alma or its author.

## What you get

- One stateless service from `ghcr.io/onepush-dev/alma-relay:1.4.0` (upstream image unmodified, listening dual-stack on 8787) behind Railway HTTPS with WebSockets/SSE.
- **`RELAY_REGISTRATION_KEY`** generated per deploy: only desktops that present it can register, so strangers can't use your relay.
- `/healthz` health check. Nothing is written to disk.

## Connect Alma

1. On the desktop: **Settings → Remote Access → Use a self-hosted relay**, enter `https://<your-domain>` and click **Use this relay**.
2. Paste `RELAY_REGISTRATION_KEY` (service Variables tab) under **Alma account → Paste a token manually**.
3. Scan the pairing QR code with the Alma app on your phone.

## Notes

- Teams: set `RELAY_TOKEN_SECRET` and mint per-user tokens with `node scripts/mint-token.mjs <user> <days>` over `railway ssh` (takes precedence over the shared key).
- TURN (live browser view on the phone) needs UDP, which Railway doesn't offer; point `TURN_URLS`/`TURN_SECRET` at a TURN server hosted elsewhere if you need it.
- Push notifications to the official iOS app can't come from a self-hosted relay (Apple key restriction); Android needs your own Firebase project.
