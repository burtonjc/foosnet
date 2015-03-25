app = require '../../src/app.coffee'
request = require('supertest').agent app.listen()

describe 'Templates', ->

  describe 'GET /', ->
    it 'should respond with a rendered view', (done) ->
      request
      .get '/'
      .expect 200
      .expect new RegExp('<html lang="en" ng-app><head><title>FoosNet</title>')
      .end done
