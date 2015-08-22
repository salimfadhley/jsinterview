_ = require('lodash')

choose = (values, probabilities, randomValue=null) ->
  if values.length != probabilities.length
    throw new Error("Mismatched length of inputs.")

  if _.sum(probabilities) != 1
    throw new Error("Probabilities must add up to 1")

  probabilities.forEach((p)->if p < 0 then throw new Error("Negative probabilities are not allowed."))

  randomValue = randomValue? and randomValue || Math.random()

  cumulative = 0
  for [p,v] in _.zip(probabilities, values)
    cumulative += p
    if randomValue <= cumulative
      break
  v

module.exports =
  "choose": choose
