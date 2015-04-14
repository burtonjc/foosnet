koa = require 'koa'
passport = require 'koa-passport'
router = require('koa-router')()
require('./routes')(router)
require './passport'

app = koa()

app.keys = [FOOSNET_SESSION_SECRET ? 'FoosballIsTopSecret']

app
  .use require('koa-render')("#{__dirname}/../views", 'jade')
  .use require('koa-static')("#{__dirname}/../../client/src")
  .use require('koa-static')("#{__dirname}/../../client/partials")
  .use require('koa-log4js')()
  .use require('koa-bodyparser')()
  .use require('koa-sess')(app)
  .use passport.initialize()
  .use passport.session()
  .use router.routes()
  .use router.allowedMethods()

module.exports = app;
