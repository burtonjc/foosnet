var express = require('express'),
    app = express();

app.get('/', function(req, res, next) {
    res.send("its working");
});

app.get('/other-route', function(req, res, next) {
    res.send("what about now with nodemon");
});

module.exports = app;
