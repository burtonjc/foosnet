require('colors');

var mongoose = require('mongoose'),
    connectUri = process.env.FOOSNET_MONGO_URI || 'mongodb://localhost/test';

mongoose.connect(connectUri);
mongoose.connection.once('open', function() {
  message = 'Connected to MongoDB at: ' + connectUri;
  console.log(message.grey)
});
mongoose.connection.on('error', function(error) {
  message = 'MongoDB error: ' + error;
  console.log(message.red);
});

module.exports = {
  User: require('./user')
};
