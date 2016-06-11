# Node Modules
test = require 'tape'
fs = require 'fs'
async = require 'async'
firebase = require 'firebase'

# My Modules
core = require '../../dist/core/core'
math = require '../../dist/compositions/math'

# Init firebase
firebase.initializeApp JSON.parse fs.readFileSync 'res/credentials.json', 'utf-8'

# Get ref
baseRef = firebase.database().ref('/funky-firebase/compositions/math')

# Init and populate array of tests
tests = []

tests.push -> test 'Increment', (t) ->

  ref = baseRef.child 'increment'
  input = 0

  # Set value at <ref> to <input>
  core.set ref, input

  # Increment value at <ref>
  .then -> math.increment ref

  # Get value at <ref> as <output>
  .then -> core.get ref
  .then (output) ->

    # Check if <input> equals <output>
    t.deepEqual (input + 1), output, "Value incremented successfully"
    t.end()

  # Catch and report errors
  .catch (err) ->
    t.error
    t.end()

tests.push -> test 'Decrement', (t) ->

  ref = baseRef.child 'decrement'
  input = 1

  # Set value at <ref> to <input>
  core.set ref, input

  # Increment value at <ref>
  .then -> math.decrement ref

  # Get value at <ref> as <output>
  .then -> core.get ref
  .then (output) ->

    # Check if <input> equals <output>
    t.deepEqual (input - 1), output, "Value decremented successfully"
    t.end()

  # Catch and report errors
  .catch (err) ->
    t.error
    t.end()

async.parallel tests
