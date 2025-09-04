FROM cloudflare/cloudflared:latest
CMD ["tunnel", "--url", "http://frps.zeabur.internal:80"]
