var mongoose = require('mongoose'),
    schema;

schema = mongoose.Schema({
    name: String
});

module.exports = mongoose.model('User', schema);
