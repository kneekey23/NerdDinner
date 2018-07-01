# **Docker Commands**

1. ```bash
docker image build -t nerd-dinner/web `
  -f Dockerfile .
  ```
2. ```bash
docker container run `
  -d -p 8020:80 --name app `
  nerd-dinner/web
  ```
3. ```bash
$ip = docker container inspect `
  --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' app
echo $ip
```
4. ```bash
docker container rm -f app
```
5. ```bash
docker-compose -f docker-compose.yml up -d
```
6. ```bash
$ip = docker container inspect `
  --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' net_monolith_nerddinner_nerddinner-web_1
```