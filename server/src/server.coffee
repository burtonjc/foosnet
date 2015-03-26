process.env.PORT ?=  2001

require 'colors'
app = require './app'
models = require './models'

models.connect()

server = app.listen process.env.PORT, ->
  host = server.address().address
  host = 'localhost' if host is '::'
  port = server.address().port
  console.log "Application running at: #{host}:#{port}".grey
