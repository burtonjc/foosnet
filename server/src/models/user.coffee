mongoose = require 'mongoose'

schema = mongoose.Schema
  sessions: Number
  google:
    id: String
    displayName: String
    picture: String
    accessToken: String
    emails: [
      type: String
      value: String
    ]

module.exports = mongoose.model 'User', schema
