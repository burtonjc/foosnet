require('colors');

var app = require('./app'),
    models = require('./models'),
    server;

process.env.PORT = process.env.PORT || 2001;
models.connect();
server = app.listen(process.env.PORT, function() {
    var host = server.address().address,
        port = server.address().port;

    message = 'Application running at: http://' + host + ':' + port
    console.log(message.grey);
});
