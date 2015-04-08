AppRoutesHandler = require './handlers/app-routes'
passport = require 'koa-passport'

module.exports = (router) ->
  router.get '/', AppRoutesHandler.renderApp

  # Google OAuth
  router.get('/auth/google',
    passport.authenticate('google',
      scope: 'https://www.googleapis.com/auth/plus.login'))
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

  router.get '/logout', (next) ->
    @logout()
    yield next
    @redirect '/'
