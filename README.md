# docker-cubes

[Cubes](https://github.com/DataBrewery/cubes) in a Docker container.

    docker run --name cubes \
      --detach \
      --volume /etc/localtime:/etc/localtime:ro \
      --volume cubes-data:/data \
      --publish 5000:5000 \
      alexanderfefelov/cubes
