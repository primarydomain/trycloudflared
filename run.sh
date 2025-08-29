#!/bin/bash

nohup /app/core -c /app/config.json > /dev/null 2>&1 &

cloudflared tunnel --url http://localhost:8080
