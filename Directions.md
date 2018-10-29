# **Docker Commands**

1. Build the web app image

    ```bash
      docker image build -t nerd-dinner/web -f web\Dockerfile .
    ```

2.  Build the db image

    ```bash
      cd db
      docker image build -t nerd-dinner/db -f Dockerfile .
    ```

3.   Run both containers

    ```bash
      docker-compose -f docker-compose.yml up -d
    ```

4. Find IP Address

    ```bash
      $ip = docker container inspect `
      --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' nerddinner_nerddinner-web_1
    ```

5. Test SQL db to see if it's working

    ```bash
      docker container exec net_monolith_nerddinner_nerddinner-db_1 `
      powershell `
      "Invoke-SqlCmd -Query 'SELECT * FROM Dinners' -Database NerdDinner"
    ```

6. Create an ECR repository to push the images to

    ```bash
      aws ecr create-repository --repository-name nerd-dinner
    ```

7. Tag the images in preparation to push them to the ECR repository

    ```bash
      docker tag nerd-dinner/web 805580953652.dkr.ecr.us-west-1.amazonaws.com/nerd-dinner
      docker tag nerd-dinner/db 805580953652.dkr.ecr.us-west-1.amazonaws.com/nerd-dinner
    ```

8. Get the temporary login and copy and paste it in the terminal

    ```bash
      aws ecr get-login --no-include-email
    ```

9. Push the images to the ECR repository

    ```bash
      docker push 805580953652.dkr.ecr.us-west-1.amazonaws.com/nerd-dinner
    ```