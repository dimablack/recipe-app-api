# recipe-app-api
Recipe API project

docker-compose run --rm app sh -c "python manage.py makemigrations"
docker-compose run --rm app sh -c "python manage.py migrate"


docker-compose run --rm app sh -c "python manage.py test"
docker-compose run --rm app sh -c "python manage.py test && flake8"

