var express = require('express'),
    app = express(),
    AppRoutesHandler = require('./handlers/app-routes')
    passport = require('passport');
require('./passport')

app.set('views', __dirname + '/../views');
app.set('view engine', 'jade');
app.engine('jade', require('jade').__express);
app.use('/js', express.static(__dirname + '/../../client/src'));
app.use(express.static(__dirname + '/../../client/partials'));

app.use(require('cookie-parser')());
app.use(require('body-parser').json());
app.use(require('cookie-session')({
  secret: process.env.FOOSNET_SESSION_SECRET || 'SuperSecretCookieSecret'
}));
app.use(passport.initialize());
app.use(passport.session());

app.get('/', AppRoutesHandler.renderApp);

// login via google
app.get('/auth/google', passport.authenticate('google', { scope: 'https://www.googleapis.com/auth/plus.login'})) ;
app.get('/auth/google/callback',
    passport.authenticate('google', { successRedirect: '/',
                                      failureRedirect: '/login' }));

module.exports = app;
