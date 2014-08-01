# Heroku buildpack for Meteor

## Supported version

This buildpack is dedicated for use with Meteor 0.8.3.
`heroku logs` prints out some routing errors, however buildpack works and you can use it in your projects. If anyone knows how to deal with routing errors, please let me know.

## Usage

First you have to create Meteor application

```
$ meteor create helloworld
helloworld: created.

To run your new app:
   cd helloworld
   meteor
```

In your application's directory you should have file named `Procfile` with the following content.

```
web: node .meteor/local/build/main.js
```

Initialize git repository in application's directory.

```
$ cd helloworld
$ git init
Initialized empty Git repository in /tmp/a/helloworld/.git/
$ git add .
$ git commit -m "First commit"
```

Create Heroku application

```
$ heroku create <unique_app_name> --stack cedar --buildpack https://github.com/jagi/heroku-buildpack-meteor.git
```

Set ROOT_URL variable

```
$ heroku config:set ROOT_URL=http://<unique_app_name>.herokuapp.com
```

Add MongoHQ and set MONGO_URL variable

```
$ heroku addons:add mongohq
$ heroku config:set MONGO_URL=$(heroku config:get MONGOHQ_URL)
```

Deploy application to Heroku server

```
$ git push heroku master
```

Enjoy!
