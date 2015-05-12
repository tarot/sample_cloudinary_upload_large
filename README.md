# sample_cloudinary_upload_large

#### bundle/bower
```
$ bundle install
$ bower install
```

#### .env
```
CLOUDINARY_URL=cloudinary://api_key:api_secret@cloud_name
PORT=3000
```

#### run
```
$ bundle exec foreman start
```

#### for Heroku
```
$ heroku config:set BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git
```

need [Cloudinary](https://elements.heroku.com/addons/cloudinary) addon.
