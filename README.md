# Polisculptor

## Requirements

Install `csvtojson`.

```
npm install csvtojson
```

## Run

Place the CSV files containing specific party terms into the folder `data/csv/parties`, and the CSV files containing specific topic terms into the folder `data/csv/topics`.

```
./export.sh -d db_name -c collection_name
```

Make sure `db_name` and `collection_name` correspond to the CSV filenames in the `data` folder.
