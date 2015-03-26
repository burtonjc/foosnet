app = require '../../src/app.coffee'
request = require('supertest').agent app.listen()

describe 'App routes', ->

  describe 'GET /', ->
    it 'should respond with a rendered view', (done) ->
      request
      .get '/'
      .expect 200
      .expect new RegExp('<html lang="en" ng-app="application"><head><title>FoosNet</title>')
      .end done
