# docker-cubes

[Cubes](https://github.com/DataBrewery/cubes) in a Docker container.

Build:

    docker build --tag alexanderfefelov/cubes .

Run:

    docker run --name cubes \
      --detach \
      --volume /etc/localtime:/etc/localtime:ro \
      --publish 5000:5000 \
      alexanderfefelov/cubes
