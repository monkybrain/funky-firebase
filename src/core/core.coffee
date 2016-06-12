# Node Modules
{curry, pipeP} = require 'ramda'

### HELPERS ###

getSnapshot = (ref) -> ref.once 'value'
getValue = (snapshot) -> snapshot.val()

### CORE FUNCTIONS ###

module.exports =

  get: curry pipeP getSnapshot, getValue

  set: curry (ref, data) -> ref.set data

  update: curry (ref, data) -> ref.update data

  remove: curry (ref) -> ref.remove()

  push: curry (ref, data) -> ref.push data

  transaction: curry (ref, fn) -> ref.transaction fn

  onValue: curry (ref, fn) -> ref.on 'value', (snapshot) -> fn getValue(snapshot)
