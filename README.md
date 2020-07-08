# docker-cubes

[Cubes](https://github.com/DataBrewery/cubes) in a Docker container.

    docker run --name cubes \
      --detach \
      --volume /etc/localtime:/etc/localtime:ro \
      --volume cubes-data:/data \
      --publish 5000:5000 \
      --health-cmd /healthcheck.sh \
      --health-start-period 3s \
      --health-interval 1m \
      --health-timeout 1s \
      --health-retries 3 \
      --log-opt max-size=10m --log-opt max-file=5 \
      alexanderfefelov/cubes
