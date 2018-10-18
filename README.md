# NFGOT
Container amb nfdump i nfcap

```
mkdir netflow
docker-compose up -d --build 
docker-compose down
```

# Consultar netflow
cd netflow
nfdump -r nfcapd.201810171125
