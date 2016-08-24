#!/usr/bin/env node

var fs = require('fs');

var filename = 'data/' + process.argv[2] + '.json';
var json = JSON.parse(fs.readFileSync(filename, 'utf8'));

newJson = [];
for (obj in json) {
  json[obj].name = json[obj]._id;
  json[obj].size = json[obj].value;
  delete json[obj]._id;
  delete json[obj].value;
}

fs.writeFileSync(filename, JSON.stringify(json), 'utf8');
