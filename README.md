# nfGot

Server Netflow per a Linux que captura les trames que li envia una Mikrotik. Genera un container amb els programes amb nfdump i nfcap.

# Configuració

Al client Mikrotik:

```
/ip traffic-flow
set enabled=yes
/ip traffic-flow ipfix
set bytes=no dst-address-mask=no dst-mac-address=no first-forwarded=no gateway=no icmp-code=no icmp-type=no igmp-type=no ip-header-length=no \
    ip-total-length=no ipv6-flow-label=no is-multicast=no last-forwarded=no packets=no protocol=no src-address-mask=no src-mac-address=no tcp-ack-num=no \
    tcp-flags=no tcp-seq-num=no tcp-window-size=no tos=no ttl=no udp-length=no
/ip traffic-flow target
add dst-address=<servidor Linux> port=9995
```

Al server Linux

```
mkdir netflow
docker-compose up -d --build 
docker-compose down
```

**Recomanat disposar d'un disc dur de varis centenars de Gigabytes.**

# Consultar netflow

```
cd netflow
sudo docker exec -ti nfgot_nfgot_1 nfdump -r /srv/netflow/nfcapd.202003130300
```
