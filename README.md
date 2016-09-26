# Fehu

Stinks. On Rails.

### Sizes:
Totem: sips -Z 800 *.jpg
Wholesale: sips -Z 200 *.jpg

### Erase & Rebuild DB
```bash
# Dev
pg_ctl restart -m fast && rails db:drop db:create db:migrate db:seed

# Staging
heroku pg:reset DATABASE --remote staging --confirm fehu-staging
heroku run rails db:migrate db:seed --remote staging

# Prod
heroku pg:reset DATABASE --app fehu --confirm fehu
heroku run rails db:migrate db:seed --app fehu
```

### Env
Name | Dev | Staging | Prod
-----|-----|---------|-----
ASSET_HOST              | http://www.frails.dev                | https://d1u99obtriaki8.cloudfront.net                              | https://d2z3gzdp2lgn3a.cloudfront.net
AWS_ACCESS_KEY_ID       | (AWS secret)                         | (AWS secret)                                                       | (AWS secret)
AWS_KEY                 |                                      | (AWS Secret)                                                       | (AWS secret)
AWS_REGION              | us-east-1                            | us-west-2                                                          | us-west-2
AWS_SECRET              |                                      | (AWS Secret)                                                       | (AWS secret)
AWS_SECRET_ACCESS_KEY   | (AWS secret)                         | (AWS secret)                                                       | (AWS secret)
DATABASE_URL            |                                      | (Set by Heroku)                                                    | (Set by Heroku)
DOMAIN                  | www.frails.dev                       | https://fehu-staging.herokuapp.com                                 | https://www.fehuleather.com
ERROR_PAGE_URL          |                                      | https://d8bjlz07mgiyc.cloudfront.net/rails/static/error.html       | https://d8bjlz07mgiyc.cloudfront.net/rails/static/error.html
FEATURE_WHOLESALE       | true                                 | false                                                              | false
IMAGEPATH               | /product-images/                     | https://d8bjlz07mgiyc.cloudfront.net/rails/products/               | https://d8bjlz07mgiyc.cloudfront.net/rails/products/
MAINTENANCE_PAGE_URL    |                                      | https://d8bjlz07mgiyc.cloudfront.net/rails/static/maintenance.html | https://d8bjlz07mgiyc.cloudfront.net/rails/static/maintenance.html
MINI_PROFILER           | false                                | (unused)                                                           | (unused)
NO_ROBOTS               | false                                | true                                                               | false
POSTMARK_API_KEY        | (Postmark secret)                    | (Postmark secret)                                                  | (Postmark secret)
RACK_TIMEOUT            | 5                                    | 5                                                                  | 27
RAILS_ENV               | development                          | (Set by Heroku)                                                    | (Set by Heroku)
RAILS_LOG_TO_STDOUT     |                                      | (Set by Heroku)                                                    | (Set by Heroku)
RAILS_THREADS           | 1                                    | 1                                                                  | 1
S3_BUCKET               | (AWS secret)                         | (AWS secret)                                                       | (AWS secret)
S3_PATH                 | https://d8bjlz07mgiyc.cloudfront.net | https://d8bjlz07mgiyc.cloudfront.net                               | https://d8bjlz07mgiyc.cloudfront.net
SECRET_KEY_BASE         | (rails secret)                       | (rails secret)                                                     | (rails secret)
SKYLIGHT_AUTHENTICATION | (Skylight secret)                    | (Skylight secret)                                                  | (Skylight secret)
STINKCODE               | s                                    | (rails secret)                                                     | (rails secret)
STINKNAME               | (rails secret)                       | (rails secret)                                                     | (rails secret)
STRIPE_PUBLISHABLE_KEY  | (Stripe secret)                      | (Stripe secret)                                                    | (Stripe secret)
STRIPE_SECRET_KEY       | (Stripe secret)                      | (Stripe secret)                                                    | (Stripe secret)
WEB_CONCURRENCY         | 2                                    | 2                                                                  | 2
