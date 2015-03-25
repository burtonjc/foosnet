koa = require 'koa'
router = require('koa-router')()
require('./routes')(router)

app = koa()

app
  .use require('koa-render')("#{__dirname}/../views", 'jade')
  .use require('koa-static')("#{__dirname}/../../client/src")
  .use require('koa-static')("#{__dirname}/../../client/partials")
  .use router.routes()
  .use router.allowedMethods()

module.exports = app;
