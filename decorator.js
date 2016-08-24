#!/usr/bin/env node

var fs = require('fs');

var json = JSON.parse(fs.readFileSync('data/immigration.json', 'utf8'));

newJson = [];
for (obj in json) {
  json[obj].name = json[obj]._id;
  json[obj].size = json[obj].value;
  delete json[obj]._id;
  delete json[obj].value;
}

fs.writeFileSync('data/immigration.json', JSON.stringify(json), 'utf8');
