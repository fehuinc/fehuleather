# Fehu

Stinks. On Rails.

### Erase & Rebuild DB
```bash
# Dev
pg_ctl restart -m fast && rake db:drop db:create db:migrate db:seed

# Staging
heroku pg:reset DATABASE --remote staging --confirm fehu-staging
heroku run rake db:migrate db:seed --remote staging

# Prod
heroku pg:reset DATABASE --app fehu --confirm fehu
heroku run rake db:migrate db:seed --app fehu
```

### Env
Name | Dev | Prod
-----|-----|-----
ASSET_HOST               |  http://www.rails-fehu.dev  |  https://d2z3gzdp2lgn3a.cloudfront.net
DATABASE_URL             |     |  Heroku Postgres secret
DOMAIN                   |  www.frails.dev  |  www.fehuleather.com
ERROR_PAGE_URL           |     |  https://d8bjlz07mgiyc.cloudfront.net/rails/static/error.html
IMAGEPATH                |  /product-images/  |  https://d8bjlz07mgiyc.cloudfront.net/rails/products/
MAINTENANCE_PAGE_URL     |     |  https://d8bjlz07mgiyc.cloudfront.net/rails/static/maintenance.html
MAX_THREADS              |     |  1
MIN_THREADS              |     |  1
PORT                     |  3000  |  3000
POSTMARK_API_KEY         |  Postmark secret  |  Postmark secret
RACK_ENV                 |  development  |
RAILS_ENV                |  development  |
S3_PATH                  |  https://d8bjlz07mgiyc.cloudfront.net  |  https://d8bjlz07mgiyc.cloudfront.net
SECRET_KEY_BASE          |  rake secret  |  rake secret
SKYLIGHT_AUTHENTICATION  |  Skylight secret  |  Skylight secret
STINKCODE                |  s  |  rake secret
STINKNAME                |  rake secret  |  rake secret
STRIPE_KEY               |  Stripe secret  |  Stripe secret
WEB_CONCURRENCY          |     |  3
