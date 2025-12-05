FROM ubuntu:22.04

RUN apt update && apt install -y wget sudo

# Install cloudflared
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
RUN dpkg -i cloudflared-linux-amd64.deb

# Copy config file
COPY config.yml /root/.cloudflared/config.yml

CMD ["cloudflared", "tunnel", "run", "esp32cam"]
