# Fehu

Stinks. On Rails.


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

STINKCODE=
STINKNAME=

IMAGEPATH=/images/content/
```
