# **Docker Commands**

1. ```bash
docker image build -t nerd-dinner/web -f web\Dockerfile .
  ```
2. ```bash
cd db
docker image build -t nerd-dinner/db -f db\Dockerfile .
```

3. ```bash
docker container run `
  -d -p 8020:80 --name app `
  nerd-dinner/web
  ```
4. ```bash
$ip = docker container inspect `
  --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' app
echo $ip
```
5. ```bash
docker container rm -f app
```
6. ```bash
docker-compose -f docker-compose.yml up -d
```
7. ```bash
$ip = docker container inspect `
  --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' net_monolith_nerddinner_nerddinner-web_1
```