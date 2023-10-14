postgres:
		docker run --name postgres16 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:16-alpine
createdb:
		docker exec -it postgres16 createdb --username=root --owner=root banking_app

deletedb:
		docker exec -it postgres16 deletedb banking_app
	
migrateup:
		cd db/migration &&  goose postgres  "postgresql://root:root@localhost:5432/banking_app?sslmode=disable" up

migratedown:
		cd db/migration && goose postgres "postgresql://root:root@localhost:5432/banking_app?sslmode=disable" down

.PHONY:
		postgres createdb deletedb migrateup migratedown


