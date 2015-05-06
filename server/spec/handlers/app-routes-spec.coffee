AppRoutesHandler = require '../../src/handlers/app-routes'
Q = require 'q'

describe 'app-routes', ->

  describe '#renderApp', ->
    beforeEach ->
      render = @sinon.stub()
      render.withArgs('index').resolves 'index file contents'
      render.withArgs('landing').resolves 'landing file contents'

      @context =
        render: render
        passport:
          user: {}

    it 'renders index if user is logged in', ->
      yield AppRoutesHandler.renderApp.apply @context

      should.exist @context.body, '@body should be index file contents'
      @context.body.should.equal 'index file contents'

    it 'renders landing if user is not logged in', ->
      delete @context.passport.user

      yield AppRoutesHandler.renderApp.apply @context

      should.exist @context.body, '@body should be landing file contents'
      @context.body.should.equal 'landing file contents'

