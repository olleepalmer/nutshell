tldrer
======

A simple wiki application.

How to run on Heroku
====================

1. Create a heroku app with `heroku apps:create`
2. Do a `git push heroku master`
3. Get a public and private Recaptcha key at https://www.google.com/recaptcha
4. Run `heroku config:add RECAPTCHA_PUBLIC_KEY="MY_PUBLIC_RECAPTCHA_KEY" RECAPTCHA_PRIVATE_KEY="MY_PRIVATE_RECAPTCHA_KEY"`
5. Run `heroku run rake db:migrate`
6. Run `heroku run rake db:seed`
7. Open the heroku application with `heroku apps:open`

