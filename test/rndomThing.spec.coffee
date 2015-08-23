chai = require 'chai'
sinon = require 'sinon'
# using compiled JavaScript file here to be sure module works
randomthing = require('../lib/randomThing.js')

expect = chai.expect
assert = chai.assert
chai.use require 'sinon-chai'

# Chai assertions instructions can be found here:
# http://ricostacruz.com/cheatsheets/chai.html

###

  Test Driven Development Exercise
  ================================

  Implement a random object chooser function. This function will have
  at least two inputs (values and probabilities) and return a single item
  selected from values.

  The probability of any single item from value being selected will be given
  by the corresponding positional value in the probabilities argument.

  randomthing.choose(values=["A", "B", "C"], probabilities=[0.7, 0.1, 0.2])
  => returns either A, B or C

  If the above example were called 100 times we might expect the function to
  return "A" about 70 times and "B" about 10 times. Since the selection is
  truly random it will not be possible to predict the number of each item
  returned exactly.

  Other requirements:
  * The function must be implemented in a test-driven style.
  * Invalid or implausible inputs should be rejected
  * You are free to use any 3rd party components you like to help with your
    implementation as long as you actually implement this algorithm.

###


describe 'randomthing', ->

  it 'should be able to choose a random thing from a selection', ->
    result = randomthing.choose(["A", "B", "C"], [1/3, 1/3, 1/3])
    expect(["A", "B", "C"]).to.include(result)

  it 'should have the inputs values and probabilities', ->
    result = randomthing.choose(values=["A", "B", "C"], probabilities=[1/3, 1/3, 1/3])
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





