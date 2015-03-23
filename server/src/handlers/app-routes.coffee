module.exports =
  renderApp: ->
    @body = yield @render 'index'
