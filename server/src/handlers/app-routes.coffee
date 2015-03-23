module.exports =
  renderApp: (next) ->
    @body = yield @render 'index'
