include make-compose.mk

project-setup: compose-setup

test:
	bin/rails test -d

check: test lint

ci-check: lint
	bin/rails db:create
	DISABLE_SPRING=1 bin/rails test
	bin/rails zeitwerk:check

fixtures-load:
	bin/rails db:fixtures:load

setup:
	bin/setup
	yarn install

db-reset:
	bin/rails db:drop
	bin/rails db:create
	bin/rails db:migrate

start:
	rm -rf tmp/pids/server.pid
	bundle exec rails s -p 3000 -b '0.0.0.0'

clean:
	bin/rails db:drop

precompile-assets:
	bundle exec rails assets:precompile

lint: lint-rubocop

lint-rubocop:
	bundle exec rubocop

db-prepare:
	bin/rails db:drop || true
	bin/rails db:create || true
	bin/rails db:schema:load || true
	bin/rails db:migrate || true
	bin/rails db:fixtures:load || true

webpacker:
	bin/webpack-dev-server

editor-setup:
	bundle exec solargraph bundle

.PHONY: tests
