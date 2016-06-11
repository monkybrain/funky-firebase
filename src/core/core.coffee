# Node Modules
{curry, pipeP} = require 'ramda'

### HELPERS ###

getSnapshot = (ref) -> ref.once 'value'
getValueFromSnapshot = (snapshot) -> snapshot.val()

### CORE FUNCTIONS ###

module.exports =

  get: curry pipeP getSnapshot, getValueFromSnapshot

  set: curry (ref, data) -> ref.set data

  update: curry (ref, data) -> ref.update data

  remove: curry (ref) -> ref.remove()

  push: curry (ref, data) -> ref.push data

  transaction: curry (ref, fn) -> ref.transaction fn
