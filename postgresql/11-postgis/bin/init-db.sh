#!/bin/sh
set -eu

usage () {
    printf "%s\n" "Usage: "
    printf "%s\n"
    printf "\t%s\n" "init-db.sh"
    printf "%s\n" "Initialize a given postgres db with PostGIS extensions"
    printf "%s\n" "Required environment vars are POSTGRES_USER, POSTGRES_DB, POSTGRES_PASSWORD"
}

create_user_and_database() {
	if [ -z $POSTGRES_DB ]; then
	    printf "%\n" "Error: missing database name. Exiting"
	    exit 1
	fi
	printf "%s\n" "  Creating database user ${POSTGRES_USER} and database ${POSTGRES_DB}"
	psql -v ON_ERROR_STOP=1 \
	    --username "$POSTGRES_USER" \
	    --dbname "$POSTGRES_DB" \
	    --set dbname="${POSTGRES_DB}" \
	    --set dbuser="${POSTGRES_USER}" \
	    --set dbpassword="${POSTGRES_PASSWORD}" \
	    -f /etc/postgis.sql

}

create_user_and_database
