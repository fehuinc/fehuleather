# Fehu

Stinks. On Rails.


# Todo

Wholesale
  Text block next to product image that Freyja can put [whatever] into — unstructured
  
  Sizes are a grid under each product build, with many number boxes for quantities
  If possible, let them pick the overall total and leave the selection of sizes up to us
  
  Made to order — ignore quantities
  
  17 ring sizes are actually based on 4 real sizes
    so in reality, there are 4 quantities for 17 order-able choices
    this might not be feasible at the moment
  
  a new kind of variation that presents as a grid (for sizes)
  
  the ability to say "I will let you pick the sizes for me" when ordering a build
  
  Email Freyja when an order is delivered
    the body of the email is the linesheet
  
  
## Notes

#### Photos
*	3 sizes: 400 (25k), 800 (75k), 1600 (300k)
*	is a ~90% quality jpeg (after ImageOptim)
*	Group, Hero, Retail (per variation), Wholesale (per variation)


#### Cross Browser
IE does not support vmax — perhaps we serve them a shittier stylesheet that doesn't do the full-fancy totem scaling?


## Dev
Here be the needed env vars:

```
RACK_ENV=development
PORT=3000

SECRET_KEY_BASE=
STRIPE_KEY=
STINKCODE=
STINKNAME=

IMAGEPATH=/images/content/
```

# Deployment

### To erase and rebuild the DB:
```bash
heroku pg:reset DATABASE --confirm fehu
heroku run rake db:migrate db:seed
```

### Maintenance Mode
```bash
heroku maintenance:on
# Later...
heroku maintenance:off
```
