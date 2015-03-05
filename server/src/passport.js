var passport = require('passport'),
    GoogleStrategy = require('passport-google-oauth').OAuth2Strategy,
    baseUri;

if(process.env.NODE_ENV === 'production') {
    baseUri = 'https://footsnet.herokuapp.com';
} else {
    baseUri = 'http://localhost:2001';
}

passport.use(new GoogleStrategy({
    callbackURL: baseUri + '/auth/google/callback',
    clientID: process.env.FOOSNET_GOOGLE_CLIENT_ID,
    clientSecret: process.env.FOOSNET_GOOGLE_CLIENT_SECRET
}, function(accessToken, refreshToken, profile, done) {
    done(null, profile);
    // User.findOrCreate({ openId: identifier }, function(err, user) {
    //     done(err, user);
    // });
}));

passport.serializeUser(function(user, done) {
  done(null, user);
});

passport.deserializeUser(function(user, done) {
  done(null, user);
});
