chai = require 'chai'
sinon = require 'sinon'
# using compiled JavaScript file here to be sure module works
randomthing = require '../lib/randomThing.js'

expect = chai.expect
chai.use require 'sinon-chai'

describe 'randomthing', ->
  it 'works', ->
    console.log("hello world!!!")

