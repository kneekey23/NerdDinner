# **Docker Commands**

1. ```bash
docker image build -t nerd-dinner/web -f web\Dockerfile .
  ```

2. ```bash
cd db
docker image build -t nerd-dinner/db -f Dockerfile .
```

3. ```bash
docker-compose -f docker-compose.yml up -d
```

4. ```bash
$ip = docker container inspect `
  --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' net_monolith_nerddinner_nerddinner-web_1
```

5. ```bash
docker container exec net_monolith_nerddinner_nerddinner-db_1 `
  powershell `
  "Invoke-SqlCmd -Query 'SELECT * FROM Dinners' -Database NerdDinner"
```

6. ```bash
aws ecr create-repository --repository-name nerd-dinner
```

7. ```bash
docker tag nerd-dinner/web 805580953652.dkr.ecr.us-west-1.amazonaws.com/nerd-dinner
```

8. ```bash
aws ecr get-login --no-include-email
```

9. ```bash
docker push 805580953652.dkr.ecr.us-west-1.amazonaws.com/nerd-dinner
```