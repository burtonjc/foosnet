var app = require('./app'),
    server;

server = app.listen(2001, function() {
    var host = server.address().address,
        port = server.address().port;

    console.log('Application running at http://' + host + ':' + port);
});
