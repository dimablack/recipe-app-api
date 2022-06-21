SHELL := /bin/bash

OK      := "\033[32;1m [Ok]\033[0m"

help:
	@printf 'Available commands\n\n'
	@IFS=$$'\n' ; \
		help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
		for help_line in $${help_lines[@]}; do \
			IFS=$$'#' ; \
			help_split=($$help_line) ; \
			help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			printf "%-30s %s\n" $$help_command $$help_info ; \
		done

start: ##Start local container
	docker-compose up -d

down: ##Down local container
	docker-compose down

migrate: ##docker-compose run --rm app sh -c "python manage.py migrate"
	docker-compose run --rm app sh -c "python manage.py migrate"

makemigrations: ##docker-compose run --rm app sh -c "python manage.py makemigrations"
	docker-compose run --rm app sh -c "python manage.py makemigrations"

test: ##docker-compose run --rm app sh -c "python manage.py test"
	docker-compose run --rm app sh -c "python manage.py test"

test-flake: ##docker-compose run --rm app sh -c "python manage.py test && flake8"
	docker-compose run --rm app sh -c "python manage.py test && flake8"

createsuperuser: ##docker-compose run --rm app sh -c "python manage.py createsuperuser"
	docker-compose run --rm app sh -c "python manage.py createsuperuser"

