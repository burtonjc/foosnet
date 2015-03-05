module.exports = {
  renderApp: function(req, res, next) {
    var options= {
      session: {}
    }

    if (req.user) {
      options.session.user = req.user
    }

    res.render('index', options);
  }
}
