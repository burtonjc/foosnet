passport = require 'koa-passport'
{User} = require './models'
request = require 'request'
Q = require 'q'

passport.serializeUser (user, done) ->
  done null, user._id

passport.deserializeUser (userId, done) ->
  Q.ninvoke User, 'findById', userId
  .then (user) ->
    done null, user
  .catch done

if process.env.NODE_ENV is 'production'
  baseUri = 'https://foosnet.herokuapp.com'
else
  baseUri = "http://localhost:#{process.env.PORT}"

GoogleStrategy = require('passport-google-oauth').OAuth2Strategy
passport.use new GoogleStrategy
  callbackURL: "#{baseUri}/auth/google/callback"
  clientID: process.env.FOOSNET_GOOGLE_CLIENT_ID
  clientSecret: process.env.FOOSNET_GOOGLE_CLIENT_SECRET
, (accessToken, refreshToken, profile, done) ->
  Q.ninvoke request, 'get',
    url: "https://www.googleapis.com/plus/v1/people/#{profile.id}"
    qs:
      access_token: accessToken
    json: true
  .then ([resp, body]) ->
    Q.ninvoke User, 'findOneAndUpdate',
      'google.id': body.id
    ,
      $set:
        google:
          id: body.id
          displayName: body.displayName
          emails: body.emails
          picture: body.image?.url
          accessToken: accessToken
      $inc:
        sessions: 1
    ,
      upsert: true
  .then (user) ->
    done null, user
  .catch done

FacebookStrategy = require('passport-facebook').Strategy
passport.use new FacebookStrategy
  clientID: process.env.FOOSNET_FACEBOOK_APP_ID
  clientSecret: process.env.FOOSNET_FACEBOOK_APP_SECRET
  callbackURL: "#{baseUri}/auth/facebook/callback"
,
  (accessToken, refreshToken, profile, done) ->
    done null, profile

TwitterStrategy = require('passport-twitter').Strategy
passport.use new TwitterStrategy
  consumerKey: process.env.FOOSNET_TWITTER_CONSUMER_KEY
  consumerSecret: process.env.FOOSNET_TWITTER_CONSUMER_SECRET
  callbackURL: "#{baseUri}/auth/twitter/callback"
,
  (token, tokenSecret, profile, done) ->
    done null, profile
