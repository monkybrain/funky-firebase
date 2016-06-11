# Node Modules
{curry} = require 'ramda'

{get, set, update, remove, push, transaction} = require '../core/core'

### First order compositions ###

add = curry (ref, data) ->
  fn = (value) -> value + data
  transaction ref, fn

subtract = curry (ref, data) ->
  fn = (value) -> value - data
  transaction ref, fn

### Second order compositions ###

increment = curry (ref) -> add ref, 1
decrement = curry (ref) -> subtract ref, 1

### EXPORTS ###
module.exports =
  add: add
  subtract: subtract
  increment: increment
  decrement: decrement
