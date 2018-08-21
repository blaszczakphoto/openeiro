# README

This is repository of a openeiro API. The API is consumed by Android App. 
The API allows to notify employees when the office is open.

## Local setup
```
git clone git@github.com:blaszczakphoto/openeiro.git
docker-compose build
docker-compose up web
```

## Deployment
```
heroku container:login
heroku container:push web
heroku container:release web
heroku run rails db:migrate
```
