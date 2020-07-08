FROM python:3.7

ENV CUBES_VERSION=1.1

ADD container/ /
ADD https://github.com/DataBrewery/cubes/archive/v$CUBES_VERSION.tar.gz /

RUN tar xfz v$CUBES_VERSION.tar.gz \
  && cd cubes-$CUBES_VERSION \
  && pip --quiet install --requirement requirements.txt \
  && pip --quiet install --requirement requirements-optional.txt \
  && pip --quiet install pymysql \
  && python setup.py install \
  && rm --force v$CUBES_VERSION.tar.gz

CMD ["slicer", "serve", "/data/slicer.ini"]
