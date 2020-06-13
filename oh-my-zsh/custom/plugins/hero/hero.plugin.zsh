# Heroku
hcfg() { heroku config --remote "${1:-heroku}"; }
hirb() { heroku run irb --remote "${1:-heroku}"; }
hcon() { heroku run console --remote "${1:-heroku}"; }
hrcon() { heroku run rails console --remote "${1:-heroku}"; }
hps() { heroku ps --remote "${1:-heroku}"; }
htail() { heroku logs --tail --remote "${1:-heroku}"; }
hpsql() { heroku pg:psql --remote "${1:-heroku}"; }
hrel() { heroku releases --remote "${1:-heroku}"; }

he() {
  reply=( heroku heroku-staging )
}

compctl -K he hcfg
compctl -K he hirb
compctl -K he hcon
compctl -K he hrcon
compctl -K he hps
compctl -K he htail
compctl -K he hpsql
compctl -K he hrel
