var express = require('express'),
    app = express(),
    AppRoutesHandler = require('./handlers/app-routes')
    passport = require('passport');

app.set('views', __dirname + '/../views');
app.set('view engine', 'jade');
app.engine('jade', require('jade').__express);
app.use('/js', express.static(__dirname + '/../../client/src'));
app.use(express.static(__dirname + '/../../client/partials'));

app.get('/', AppRoutesHandler.renderApp);

//Redirect the user to Google for authentication.  When complete, Google
//will redirect the user back to the application at
// /auth/google/return
app.get('/auth/google', passport.authenticate('google'));

//Google will redirect the user to this URL after authentication. Finish
//the process by verifying the assertion. If valid, the user will be
//logged in.  Otherwise, authentication has failed.
app.get('/auth/google/return',
    passport.authenticate('google', { successRedirect: '/',
                                      failureRedirect: '/login' }));

module.exports = app;
