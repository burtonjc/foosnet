var AppRoutesHandler = require('../../src/handlers/app-routes');

describe('app-routes', function() {
  describe('#renderApp', function() {
    it('renders index.html', function() {
      var req = {},
          res = {
            render: this.stub()
          },
          next = this.stub()

      AppRoutesHandler.renderApp(req, res, next);

      res.render.callCount.should.equal(1);
      res.render.should.have.been.calledWith('index');
    });
  });
});
