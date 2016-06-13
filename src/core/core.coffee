# Node Modules
{curry, pipeP} = require 'ramda'

### HELPERS ###

getSnapshot = (ref) -> ref.once 'value'
getValue = (snapshot) -> snapshot.val()
onEvent = (ref, event, fn) -> ref.on event, (snapshot, prevChildKey) -> fn getValue(snapshot), prevChildKey

### CORE FUNCTIONS ###

module.exports =

  ### OPERATIONS ###

  get: curry pipeP getSnapshot, getValue

  set: curry (ref, data) -> ref.set data

  update: curry (ref, data) -> ref.update data

  remove: curry (ref) -> ref.remove()

  push: curry (ref, data) -> ref.push data

  transaction: curry (ref, fn) -> ref.transaction fn

  ### REFERENCES ###

  child: curry (ref, path) -> ref.child path

  url: curry (ref) -> ref.toString()

  ### EVENTS ###

  onValue: curry (ref, fn) -> onEvent ref, 'value', fn

  onChildAdded: curry (ref, fn) -> onEvent ref, 'child_added', fn

  onChildChanged: curry (ref, fn) -> onEvent ref, 'child_changed', fn

  onChildMoved: curry (ref, fn) -> onEvent ref, 'child_moved', fn

  onChildRemoved: curry (ref, fn) -> onEvent ref, 'child_removed', fn
