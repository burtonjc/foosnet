AppRoutesHandler = require '../../src/handlers/app-routes'

describe 'app-routes', ->

  describe '#renderApp', ->
    it 'renders index.html', ->
      context =
        render: @sinon.stub().withArgs('index').resolves 'index file contents'
        passport: {}

      yield AppRoutesHandler.renderApp.apply context

      should.exist context.body, '@body should be index file contents'
      context.body.should.equal 'index file contents'
