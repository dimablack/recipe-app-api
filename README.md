# recipe-app-api
Recipe API project
docker-compose run --rm app sh -c "python manage.py startapp app ."
docker-compose run --rm app sh -c "python manage.py startapp app"
docker-compose run --rm app sh -c "python manage.py startapp user"
docker-compose run --rm app sh -c "python manage.py startapp recipe"

docker-compose run --rm app sh -c "python manage.py makemigrations"
docker-compose run --rm app sh -c "python manage.py migrate"


docker-compose run --rm app sh -c "python manage.py test"
docker-compose run --rm app sh -c "python manage.py test && flake8"

docker-compose run --rm app sh -c "python manage.py createsuperuser"
