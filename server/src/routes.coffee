AppRoutesHandler = require './handlers/app-routes'

module.exports = (router) ->
  router.get '/', AppRoutesHandler.renderApp
