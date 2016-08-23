#!/bin/sh

echo "Sculpting..."
mongo republican sculptor.js --quiet

echo "Exporting data..."
mongoexport --quiet --jsonArray --pretty --sort '{name: -1}' --limit 100 --db republican --collection immigration_word_count --out data/immigration.json

#TODO: rename JSON fields

echo "Done!"
