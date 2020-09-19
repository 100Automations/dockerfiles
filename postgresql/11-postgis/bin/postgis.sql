--- create PostGIS extension
\echo 'postgis.sql: creating user and db'

/* DROP ROLE if exists :dbuser; */
/* CREATE ROLE :dbuser WITH PASSWORD :'dbpassword'; */

GRANT ALL PRIVILEGES ON DATABASE :dbname TO :dbuser;
\c :dbname;

/* CREATE SCHEMA IF NOT EXISTS AUTHORIZATION :dbname; */

DROP EXTENSION IF EXISTS postgis CASCADE;
CREATE EXTENSION postgis;

DROP EXTENSION IF EXISTS fuzzystrmatch CASCADE;
CREATE EXTENSION fuzzystrmatch;

DROP EXTENSION IF EXISTS postgis_tiger_geocoder CASCADE;
CREATE EXTENSION postgis_tiger_geocoder;

DROP EXTENSION IF EXISTS postgis_topology CASCADE;
CREATE EXTENSION postgis_topology;

\echo 'Testing the extensions are valid...'

-- test that extensions are valid
SET search_path = public, tiger;

--- test address to LA County Registrar headquarters
SELECT
    na.address,
    na.streetname,
    na.streettypeabbrev,
    na.zip
FROM
    normalize_address ('12400 Imperial Highway, Norwalk, CA 90650') AS na;

\echo 'success!'
