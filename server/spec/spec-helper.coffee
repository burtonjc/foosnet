Q = require 'q'
sinon = require('sinon-as-promised') Q.Promise

beforeEach ->
  @sinon = sinon.sandbox.create()

afterEach ->
  @sinon.restore()
