compose:
	docker-compose up -d

compose-build:
	docker-compose build

compose-logs:
	docker-compose logs -f

compose-down:
	docker-compose down || true

compose-stop:
	docker-compose stop || true

compose-restart:
	docker-compose restart

compose-setup: compose-down compose-build app-setup

compose-ci-build:
	docker-compose -f docker-compose.yml build

compose-ci:
	docker-compose --file docker-compose.yml build
	docker-compose --file docker-compose.yml up --abort-on-container-exit

app-bash:
	docker-compose run web /bin/bash

app-test:
	docker-compose run web make test
	docker-compose run web make lint

app-test-file:
	docker-compose run web make test ${T}

app-rails-console:
	docker-compose run web bin/rails c

app-setup: app-install app-db-prepare

app-install:
	docker-compose run web make setup

app-db-prepare:
	docker-compose run web make db-prepare
