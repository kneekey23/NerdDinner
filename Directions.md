# **Commands**

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
firefox "http://$ip"
```