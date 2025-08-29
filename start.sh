#!/bin/bash

/app/core run -c /app/config.json &

cloudflared tunnel --url http://localhost:8080

