#!/bin/bash
NAME="djangoblog" # Name of the application
DJANGODIR=/code/DjangoBlog # Django project directory
SOCKFILE=/code/DjangoBlog/run/gunicorn.sock # we will communicte using this unix socket
USER=root # the user to run as
GROUP=root # the group to run as
NUM_WORKERS=3 # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=DjangoBlog.settings # which settings file should Django use
DJANGO_WSGI_MODULE=DjangoBlog.wsgi # WSGI module name


echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

python manage.py makemigrations 
python manage.py migrate

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec gunicorn ${DJANGO_WSGI_MODULE}:application \
--name $NAME \
--workers $NUM_WORKERS \
--user=$USER --group=$GROUP \
--bind 0.0.0.0:8000 \
--log-level=debug \
--log-file=-
