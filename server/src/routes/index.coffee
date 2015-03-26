
module.exports = (router) ->
  require('./application')(router)
  require('./authentication')(router)
