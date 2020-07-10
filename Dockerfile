FROM python:3.7

ENV CUBES_VERSION=1.1

ENV CUBES_STUFF=v$CUBES_VERSION.tar.gz

ADD container/ /
ADD https://github.com/DataBrewery/cubes/archive/$CUBES_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       curl \
       > /dev/null \
  && tar xfz $CUBES_STUFF \
  && cd cubes-$CUBES_VERSION \
  && pip --quiet install --requirement requirements.txt \
  && pip --quiet install --requirement requirements-optional.txt \
  && pip --quiet install \
       psycopg2 \
       pymysql \
  && python setup.py install \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$CUBES_STUFF

CMD ["slicer", "serve", "/workspace/slicer.ini"]
