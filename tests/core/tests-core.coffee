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

tests.push -> test 'Set and get value', (t) ->

  t.plan 1
  ref = baseRef.child 'set_and_get'

  # Set value at <ref> to <input>
  core.set ref, input.string

  # Get value at <ref> as <output>
  .then -> core.get ref

  # Check if <input> equals <output>
  .then (output) -> t.deepEqual input.string, output

  # Catch and report errors
  .catch (err) -> t.error

tests.push -> test 'Remove value', (t) ->

  t.plan 1

  ref = baseRef.child 'remove'

  # Set value at <ref> to <input>
  core.set ref, input.string

  # Remove value at <ref>
  .then -> core.remove ref

  # Get value at <ref>
  .then -> core.get ref

  # Value at <ref> should be <null>
  .then (output) -> t.deepEqual output, null

  # Catch and report errors
  .catch t.error

# 3 - On value changed
tests.push -> test 'On value changed', (t) ->

  t.plan 1

  ref = baseRef.child 'value_changed'

  # Set value at <ref> to <input>
  core.set ref, input.string
  # Attach callback to value change at <ref>
  .then -> core.on ref, 'value',
    # Callback
    (val) -> t.deepEqual input.string, val

async.parallel tests
