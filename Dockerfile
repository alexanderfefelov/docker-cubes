FROM python:3.7

ENV VERSION=1.1

ENV TGZ=v$VERSION.tar.gz

ADD container/ https://github.com/DataBrewery/cubes/archive/$TGZ /

RUN apt-get -qq update \
  && apt-get -qq --no-install-recommends install \
       curl \
  && tar xfz $TGZ \
  && cd cubes-$VERSION \
  && pip --quiet install --requirement requirements.txt \
  && pip --quiet install --requirement requirements-optional.txt \
  && pip --quiet install \
       psycopg2 \
       pymysql \
  && python setup.py install \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$TGZ

CMD ["slicer", "serve", "/workspace/slicer.ini"]
