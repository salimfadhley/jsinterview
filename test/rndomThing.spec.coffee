chai = require 'chai'
sinon = require 'sinon'
# using compiled JavaScript file here to be sure module works
randomthing = require('../lib/randomThing.js')

expect = chai.expect
assert = chai.assert
chai.use require 'sinon-chai'

# Chai assertions instructions can be found here:
# http://ricostacruz.com/cheatsheets/chai.html

describe 'randomthing', ->

  it 'should be able to choose a random thing from a selection', ->
    result = randomthing.choose(["A", "B", "C"], [1/3, 1/3, 1/3])
    expect(["A", "B", "C"]).to.include(result)

  it 'should choose never choose probabilities that hae a zero value', ->
    result = randomthing.choose(["A", "B", "C"], [0, 1, 0])
    expect(result).to.equal("B")

  it 'should choose never choose probabilities that hae a zero value, part 2', ->
    result = randomthing.choose(["A", "B", "C"], [0, 0, 1])
    expect(result).to.equal("C")

  it 'should be possible to inject a random value into the function', ->
    result = randomthing.choose(["A", "B", "C"], [0.1, 0.1, 0.8], randomValue=0.15)
    expect(result).to.equal("B")

  it 'should be possible to inject a random value into the function, part deux', ->
    result = randomthing.choose(["A", "B", "C"], [0.1, 0.1, 0.8], randomValue=0.99)
    expect(result).to.equal("C")

  it "should throw an error when the probabilities have a different length to the values", ->
    assert.throws(()->randomthing.choose(["A", "B"], [1.0]))

  it "should throw an error when the probabilities do not add up to 1", ->
    assert.throws(()->randomthing.choose(["A", "B"], [0.0, 9.0]))

  it "should throw an error when negative probabilities are encountered", ->
    assert.throws(()->randomthing.choose(["A", "B"], [1.5, -0.5]))





