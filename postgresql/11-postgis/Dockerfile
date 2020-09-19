# buils this as docker build -t hackforla/postgres:11-postgis .
FROM postgres:11
LABEL maintainer="github.com/100Automations"

ENV PG_MAJOR 11
ENV POSTGIS_MAJOR 2.5
ENV POSTGIS_VERSION 2.5.1+dfsg-1

RUN apt-get update \
      && apt-cache showpkg postgresql-11-postgis-2.5 \
      && apt-get install -y --no-install-recommends \
           postgresql-11-postgis-2.5 \
           postgresql-11-postgis-2.5-scripts \
           postgis \
      && rm -rf /var/lib/apt/lists/*

COPY ./bin /bin

RUN chmod -R +x /bin/ && \
  mkdir -p /docker-entrypoint-initdb.d/ && \
  ln -svf /bin/postgis.sql /etc/postgis.sql  && \
  ln -svf /bin/init-db.sh /docker-entrypoint-initdb.d/ 

CMD ["postgres"]
