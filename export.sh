#!/bin/bash

echo "Sculpting..."
mongo republican sculptor.js --quiet

echo "Exporting data..."
mongoexport --quiet --jsonArray --sort '{name: -1}' --limit 100 --db republican --collection immigration_word_count --out data/immigration.json

echo "Finishing..."
./decorator.js

echo "Done!"
