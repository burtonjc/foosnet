AppRoutesHandler = require '../../src/handlers/app-routes'
Q = require 'q'

describe 'app-routes', ->

  describe '#renderApp', ->
    it 'renders index if user is logged in', ->
      context =
        render: @sinon.stub().withArgs('index').resolves 'index file contents'
        passport:
          user: {}

      yield AppRoutesHandler.renderApp.apply context

      should.exist context.body, '@body should be index file contents'
      context.body.should.equal 'index file contents'

    it 'renders landing if user is not logged in', ->
      context =
        render: @sinon.stub().withArgs('landing').returns(Q.resolve('landing file contents'))
        passport: {}

      yield AppRoutesHandler.renderApp.apply context

      should.exist context.body, '@body should be landing file contents'
      context.body.should.equal 'landing file contents'

