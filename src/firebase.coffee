# Node Modules
{curry, pipeP} = require 'ramda'

### HELPERS ###

getSnapshot = (ref) -> ref.once 'value'
getValueFromSnapshot = (snapshot) -> snapshot.val()

### CORE FUNCTIONS ###

get = curry pipeP getSnapshot, getValueFromSnapshot

update = curry (ref, data) -> ref.update data

set = curry (ref, data) -> ref.set data

remove = curry (ref) -> ref.remove()

push = curry (ref, data) -> ref.push data

transaction = curry (ref, fn) -> ref.transaction fn

### CORE COMPOSITIONS ###

# Mathematical operations
add = curry (ref, data) ->
  fn = (value) -> value + data
  transaction ref, fn

subtract = curry (ref, data) ->
  fn = (value) -> value - data
  transaction ref, fn

### HIGHER LEVEL COMPOSITIONS ###

# ++/--
increment = add 1
decrement = subtract 1

### EXPORTS ###
module.exports =
  get: get
  set: set
  update: update
  remove: remove
  push: push
  increment: increment
  decrement: decrement
  add: add
  subtract: subtract
