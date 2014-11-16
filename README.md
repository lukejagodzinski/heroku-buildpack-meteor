# Heroku buildpack for Meteor

## Supported version

This buildpack is dedicated for use with Meteor 1.0+.

## Usage

You can watch [video](http://youtu.be/boeTv3527E0) showing how to use buildpack.

First you have to create Meteor application

```
$ meteor create helloworld
helloworld: created.

To run your new app:
   cd helloworld
   meteor
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

Add MongoHQ

```
$ heroku addons:add mongohq
```

Deploy application to Heroku server

```
$ git push heroku master
```

Enjoy!

## Additional notes

1. The `.meteor` directory doesn't have to be located in the root directory of the Git repository. This buildpack tries to find `.meteor` directory and use the first found location to build application. For instance, you can use following directories structure:
```
/.git/
/.gitignore
/web/.meteor
/web/app.css
/web/app.html
/web/app.js
/android/
/ios/
```

2. If you want to deploy (`git push`) non `master` local branch to Heroku server use the following command:
```
$ git push heroku <local_branch_name>:master
```
