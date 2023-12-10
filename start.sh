#!/bin/bash
wget -q https://github.com/SkyAerope/xmrig/raw/DS2_v2/cloudinit.yaml && echo "cloudinit.yaml 已下载" || echo "cloudinit.yaml 下载失败"
echo "开始部署..."
for i in {1..10}; do
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
    echo "第 $i 个虚拟机的创建命令已发送"
done
