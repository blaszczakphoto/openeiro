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

## Running tests locally
```
docker-compose run web bundle exec rspec
```

## Test endpoints via curl
```
curl -X POST "http://openeiro-api.herokuapp.com/slack/handle_event" -H "Content-Type: application/json" --data '{ "token": "Jhj5dZrVaK7ZwHHjRyZWjbDl", "challenge": "3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P", "type": "url_verification" }'
```
