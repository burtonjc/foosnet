mongoose = require 'mongoose'
models = require '../../src/models'

describe 'models/index', ->

  it 'exports models', ->
    should.exist models.connect
    models.connect.should.be.a 'function'

    should.exist models.User
    models.User.should.be.a 'function'

  describe '#connect', ->
    beforeEach ->
      @sinon.stub mongoose, 'connect'

    it 'connects to MongoDB at default location', ->
      @sinon.stub process, 'env', {}

      models.connect()

      mongoose.connect.callCount.should.equal 1
      mongoose.connect.should.have.been.calledWith 'mongodb://localhost/test'

    it 'connects to MongoDB at environment location', ->
      @sinon.stub process, 'env', FOOSNET_MONGO_URI: 'configured/uri'

      models.connect()

      mongoose.connect.callCount.should.equal 1
      mongoose.connect.should.have.been.calledWith 'configured/uri'
