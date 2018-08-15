FROM python:2.7-slim-stretch

ENV CUBES_VERSION=1.1

ADD https://github.com/DataBrewery/cubes/archive/v$CUBES_VERSION.tar.gz /
ADD container/ /

RUN tar xfz v$CUBES_VERSION.tar.gz \
  && rm --force v$CUBES_VERSION.tar.gz \
  && cd cubes-$CUBES_VERSION \
  && pip --quiet install --requirement requirements.txt \
  && pip --quiet install --requirement requirements-optional.txt \
  && python setup.py install

VOLUME /data

EXPOSE 5000

CMD ["slicer", "serve", "/data/slicer.ini"]
