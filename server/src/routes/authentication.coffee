passport = require 'koa-passport'

module.exports = (router) ->

  # Google OAuth
  router.get('/auth/google',
    passport.authenticate('google',
      scope: 'https://www.googleapis.com/auth/plus.login
              https://www.googleapis.com/auth/plus.profile.emails.read'))
  router.get('/auth/google/callback',
    passport.authenticate('google',
      successRedirect: '/'
      failureRedirect: '/login'))

  # Facebook OAuth
  router.get('/auth/facebook',
    passport.authenticate('facebook'))
  router.get('/auth/facebook/callback',
    passport.authenticate('facebook',
      successRedirect: '/'
      failureRedirect: '/login'))

  # Twitter OAuth
  router.get('/auth/twitter',
    passport.authenticate('twitter'))
  router.get('/auth/twitter/callback',
    passport.authenticate('twitter',
      successRedirect: '/'
      failureRedirect: '/login'))

  router.get '/logout', (next) ->
    @logout()
    yield next
    @redirect '/'
