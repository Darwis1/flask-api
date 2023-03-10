#!/bin/bash

echo "web: gunicorn server:app" > Procfile
git init
git add .
git commit -m "UAS PemWeb0440"

heroku create uasweb-0440
git push heroku master

heroku addons:create cleardb:ignite

dbURL=heroku config | grep CLEARDB_DATABASE_URL
heroku config:set DATABASE_URL=$dbURL

echo $dbURL
