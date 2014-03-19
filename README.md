Nutshell
========

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

In order for email to work on Heroku, go to https://addons.heroku.com/sendgrid
and choose the starter package for your application - it allows up to 200 emails/day,
which should be enough for testing purposes, since the only feature that
requires email sending is *Forgot password*.
After that, run `heroku config:add DOMAIN=ntshll.com SMTP_SERVER=smtp.sendgrid.net SMTP_PORT=25 MAILER_DOMAIN=ntshll.com`

In order to add a new category, run something like
`heroku run rake "categories:add['Science & Nature']"`

In order to remove a category, run something like
`heroku run rake "categories:remove['Science & Nature']"`. Please be careful with this last command, it will also remove all the posts in that category.
