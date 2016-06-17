# Node Modules
test = require 'tape'
fs = require 'fs'
async = require 'async'
firebase = require 'firebase'

# My Modules
core = require '../../dist/core/core'

# Init firebase
credentials = JSON.parse fs.readFileSync 'res/credentials.json', 'utf-8'
firebase.initializeApp credentials

# Get ref
baseRef = firebase.database().ref('/funky-firebase/core')

# Init and populate array of tests
tests = []

# Test values
input =
  string: "Come on you irons!"
  number: 10
  object:
    key: 'value'

# 1 - onValue
tests.push -> test 'onValue', (t) ->

  t.plan 1
  ref = baseRef.child 'onValue'

  # Set value at ref to input
  core.set ref, input.string
  # Attach callback to value change at ref
  .then -> core.onValue ref,
    # TEST: Value should equal input
    (value) -> t.deepEqual value, input.string, "Callback fired on value change"

# 2 - Child manipulation
tests.push -> test 'Child manipulation callbacks', (t) ->

  t.plan 3
  ref = core.child baseRef, 'onChildAdded'
  childRef = core.child ref, 'test'

  # Attach callbacks
  core.onChildAdded ref, (value) ->
    t.deepEqual value, input.string, "Callback fired on child added"

  core.onChildChanged ref, (value) ->
    t.deepEqual value, input.number, "Callback fired on child changed"

  core.onChildRemoved ref, (value) ->
    t.pass "Callback fired on child removed"

  core.set childRef, input.string
  .then -> core.set childRef, input.number
  .then -> core.remove childRef

async.parallel tests
