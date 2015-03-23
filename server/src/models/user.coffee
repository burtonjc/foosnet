mongoose = require 'mongoose'

schema = mongoose.Schema name: String

module.exports = mongoose.model 'User', schema
