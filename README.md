# Demo project with DBT

## Overview

Here we mimic a pipeline with trip data and customer data.

## Installation

```bash
pdm install
```

## Metrics

### Trips

1. city level
    1. trip distance
    2. trip duration
    3. trip count (origin & count)
2. origin & destination
    1. for each city, highest from and to

### How to use

1. setup python environment and install faker
2. run `python generate_data.py` to generate trip data
3. run `duckdb dbt_demo.duckdb` to create database and `.read scripts/load_trips.sql` to load data, then quit duckdb
4. run `dbt run -m {model_name}` on any model

### TODO

- [ ] add unit tests on models
- [ ] add data tests on ads result
- [ ] add git post-hook on sql format
- [ ] create some macros and analyses
- [ ] add some dbt docs
- [ ] add examples of snapshots

### Hooks

- `chmod +x .hooks/pre-commit`
- `ln .hooks/pre-commit .git/hooks`
