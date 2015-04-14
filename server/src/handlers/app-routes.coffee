module.exports =
  renderApp: ->
    options= session: {}

    if @passport.user
      options.session.user = @passport.user
      @body = yield @render 'index', options
    else
        @body = yield @render 'landing', options
