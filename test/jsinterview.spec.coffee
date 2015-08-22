chai = require 'chai'
sinon = require 'sinon'
# using compiled JavaScript file here to be sure module works
jsinterview = require '../lib/jsinterview.js'

expect = chai.expect
chai.use require 'sinon-chai'

describe 'jsinterview', ->
  it 'works', ->
    actual = jsinterview 'World'
    expect(actual).to.eql 'Hello World'
