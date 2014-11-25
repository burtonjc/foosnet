var AppRoutesHandler = require('../../src/handlers/app-routes'),
    sinon = require('sinon');

describe('app-routes', function() {
  describe('#renderApp', function() {
    it('renders index.html', function() {
      var req = {},
          res = {
            render: sinon.stub()
          },
          next = sinon.stub()

      AppRoutesHandler.renderApp(req, res, next);

      res.render.callCount.should.equal(1);
      res.render.should.have.been.calledWith('index');
    });
  });
});
