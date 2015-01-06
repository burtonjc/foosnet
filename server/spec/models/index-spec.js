var mongoose = require('mongoose'),
    models = require('../../src/models');

describe('models/index', function() {

    it('exports models', function() {
        should.exist(models.connect);
        models.connect.should.be.a('function');

        should.exist(models.User);
        models.User.should.be.a('function');
    });

    describe('#connect', function() {
        beforeEach(function() {
            this.stub(mongoose, 'connect');
        });

        it('connects to MongoDB at default location', function() {
            this.stub(process, 'env', {});

            models.connect()

            mongoose.connect.callCount.should.equal(1);
            mongoose.connect.should.have.been.calledWith('mongodb://localhost/test');
        });

        it('connects to MongoDB at environment location', function() {
            this.stub(process, 'env', {FOOSNET_MONGO_URI: 'configured/uri'});

            models.connect()

            mongoose.connect.callCount.should.equal(1);
            mongoose.connect.should.have.been.calledWith('configured/uri');
        });
    });
});
