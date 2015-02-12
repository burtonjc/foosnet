var passport = require('passport')
    , GoogleStrategy = require('passport-google').Strategy;

passport.use(new GoogleStrategy({
    returnURL: 'http://www.foosnet.com/auth/google/return',
    realm: 'http://www.foosnet.com'
    },
    function(identifier, profile, done) {
        User.findOrCreate({ openId: identifier }, function(err, user) {
            done(err, user);
        })
    }
));
