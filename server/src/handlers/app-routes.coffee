module.exports =
  renderApp: ->
    # var options= {
    #   session: {}
    # }

    # if (req.user) {
    #   options.session.user = req.user
    # }


    @body = yield @render 'index'
