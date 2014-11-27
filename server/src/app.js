var express = require('express'),
    app = express(),
    AppRoutesHandler = require('./handlers/app-routes');

app.set('views', __dirname + '/../views');
app.set('view engine', 'jade');
app.engine('jade', require('jade').__express);

app.get('/', AppRoutesHandler.renderApp);

module.exports = app;
