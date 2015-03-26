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


# app.use(require('cookie-parser')());
# app.use(require('body-parser').json());
# app.use(require('cookie-session')({
#   secret: process.env.FOOSNET_SESSION_SECRET || 'SuperSecretCookieSecret'
# }));
# app.use(passport.initialize());
# app.use(passport.session());

# app.get('/', AppRoutesHandler.renderApp);

# // login via google
# app.get('/auth/google', passport.authenticate('google', { scope: 'https://www.googleapis.com/auth/plus.login'})) ;
# app.get('/auth/google/callback',
#     passport.authenticate('google', { successRedirect: '/',
#                                       failureRedirect: '/login' }));



module.exports = app;
