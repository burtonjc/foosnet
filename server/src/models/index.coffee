require 'colors'

connect = ->
  mongoose = require('mongoose')
  connectUri = process.env.FOOSNET_MONGO_URI ? 'mongodb://localhost/test'

  mongoose.connect connectUri

  mongoose.connection.once 'open', ->
    console.log "Connected to MongoDB at: #{connectUri}".grey

  mongoose.connection.on 'error', (error) ->
    message = 'MongoDB error: ' + error
    console.log "MongoDB error: #{error}.red"

module.exports =
  connect: connect
  User: require './user'
