#!/bin/bash

db_flag=false;
collection_flag=false;

usage() { echo "Usage: $0 -d <database> -c <collection>" 1>&2; exit 1; }

while getopts ":d:c:" o; do
    case "${o}" in
        d)
            d=${OPTARG};
            db_flag=true;
            ;;
        c)
            c=${OPTARG};
            collection_flag=true;
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND - 1));

if [ "$db_flag" = false ]; then
    echo "Database information is missing" 1>&2;
    exit 1;
elif [ "$collection_flag" = false ]; then
    echo "Collection information is missing" 1>&2;
    exit 1;
else
    echo "Sculpting...";
    mongo $d sculptor.js --quiet;

    echo "Exporting data...";
    mongoexport --quiet --jsonArray --sort "{value: -1}" --limit 100 --db $d --collection "${c}_word_count" --out data/"${c}.json";

    echo "Finishing...";
    ./decorator.js;

    echo "Done!";
fi
