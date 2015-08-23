#chai = require 'chai'
#sinon = require 'sinon'
## using compiled JavaScript file here to be sure module works
#product = require('../lib/product.js')
#
#expect = chai.expect
#assert = chai.assert
#chai.use require 'sinon-chai'
#
#describe 'product', ->
#
#  it 'there is exactly one product of length zero', ->
#    result = product(["A", "B", "C"], 0)
#    expect(result.length).equal(0)
#
#  it 'if product is length 1 then there as many items as inputs', ->
#    result = product(["A", "B", "C"], 1)
#    expect(result.length).equal(3)
