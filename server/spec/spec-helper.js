var sinon = require('sinon'),
    sandbox;

beforeEach(function() {
    sandbox = sinon.sandbox.create({
        injectInto: this,
        properties: ["spy", "stub", "mock"]
    });
});

afterEach(function() {
    sandbox.restore()
});
