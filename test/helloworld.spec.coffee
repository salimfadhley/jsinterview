chai = require 'chai'
sinon = require 'sinon'
# using compiled JavaScript file here to be sure module works
helloworld = require '../lib/helloworld.js'

expect = chai.expect
chai.use require 'sinon-chai'

describe 'helloworld', ->
  it 'works', ->
    actual = helloworld('foo')
    expect(actual).to.eql 'Hello foo'
