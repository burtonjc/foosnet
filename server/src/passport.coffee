passport = require 'koa-passport'

passport.serializeUser (user, done) ->
  done null, user

passport.deserializeUser (user, done) ->
  done null, user

if process.env.NODE_ENV is 'production'
  baseUri = 'https://footsnet.herokuapp.com'
else
  baseUri = "http://localhost:#{process.env.PORT}"

GoogleStrategy = require('passport-google-oauth').OAuth2Strategy
passport.use new GoogleStrategy
  callbackURL: "#{baseUri}/auth/google/callback"
  clientID: process.env.FOOSNET_GOOGLE_CLIENT_ID
  clientSecret: process.env.FOOSNET_GOOGLE_CLIENT_SECRET
,
  (accessToken, refreshToken, profile, done) ->
    done null, profile
