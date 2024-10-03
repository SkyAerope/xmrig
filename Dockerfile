FROM ubuntu:latest

WORKDIR /xmrig

COPY . .

RUN chmod +x ./xmrig

ENTRYPOINT sed -i "s/Chicken/$(hostname)/g" config.json && ./xmrig
