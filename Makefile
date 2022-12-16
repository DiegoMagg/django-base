install:
	cd app && pipenv install

dev-install:
	cd app && pipenv install --dev && pipenv run pre-commit install

up:
	docker-compose up -d

down:
	docker-compose down

shell:
	cd app && pipenv run python manage.py shell

dev-server-up:
	cd app && pipenv run python manage.py runserver 0:8000

migrations:
	cd app && pipenv run python manage.py makemigrations

migrate:
	cd app && pipenv run python manage.py migrate

up-build:
	docker-compose -f docker-compose.yml up -d --build

mariadb-up:
	docker-compose -f docker-compose.yml up -d sfh-mariadb

test:
	cd app && pipenv run pytest

test-coverage:
	cd app && pipenv run coverage erase
	rm -rf app/htmlcov
	cd app && pipenv run coverage run -m pytest
	cd app && pipenv run coverage html
