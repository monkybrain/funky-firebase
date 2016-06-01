# Node Modules
{pipeP, type} = require 'ramda'

### HELPERS ###

getSnapshot = (ref) -> ref.once 'value'
getValueFromSnapshot = (snapshot) -> snapshot.val()

### BASIC FUNCTIONS ###

get = (ref) -> getSnapshot(ref).then(getValueFromSnapshot)

update = (ref, data) -> ref.update data

set = (ref, data) -> ref.set data

remove = (ref) -> ref.remove()

push = (ref, data) -> ref.push data

transaction = (ref, fn) -> ref.transaction fn

### BASIC COMPOSITIONS ###

add = (ref, data) ->
  fn = (value) -> value + data
  transaction ref, fn

subtract = (ref, data) ->
  fn = (value) -> value - data
  transaction ref, fn

### HIGHER LEVEL COMPOSITIONS ###

increment = (ref) -> add ref, 1

decrement = (ref) -> subtract ref, 1

module.exports =
  get: get
  set: set
  update: update
  remove: remove
  push: push
  increment: increment
  decrement: decrement
  add: add
