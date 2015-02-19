var express = require('express'),
    app = express(),
    AppRoutesHandler = require('./handlers/app-routes');

app.set('views', __dirname + '/../views');
app.set('view engine', 'jade');
app.engine('jade', require('jade').__express);
app.use('/js', express.static(__dirname + '/../../client/src'));
app.use(express.static(__dirname + '/../../client/partials'));

app.get('/', AppRoutesHandler.renderApp);

module.exports = app;
