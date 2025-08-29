#!/bin/bash

nohup ./core run -c config.json > /dev/null 2>&1 &

cloudflared tunnel --url http://localhost:8080

