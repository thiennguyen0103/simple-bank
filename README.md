# **1. Set up**
* Config Makefile

Change **username** and **password**
```
postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=<username> -e  POSTGRES_PASSWORD=<password> -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=<username> --owner=<username> simple_bank

dropdb:
	docker exec -it postgres12 dropdb simple_bank

.PHONY: postgres createdb dropdb
```

* Docker
```
docker pull postgres@12-alpine
make postgres
make createdb
make migrateup
```