postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=<username> -e  POSTGRES_PASSWORD=<password> -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=<username> --owner=<username> simple_bank

dropdb:
	docker exec -it postgres12 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:1@localhost:5432/simple_bank?sslmode=disable" --verbose up

migratedown:
	migrate -path db/migration -database "postgresql://<username>:<password>@localhost:5432/simple_bank?sslmode=disable" --verbose down

sqlc:
	docker run --rm -v ${pwd}:/src -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test