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

tests.push -> test 'Multiply', (t) ->

  t.plan 1
  t.timeoutAfter 5000

  ref = baseRef.child 'multiply'
  input = 10
  factor = 10

  # Set value at <ref> to <input>
  core.set ref, input

  # Increment value at <ref>
  .then -> math.multiply ref, factor

  # Get value at <ref> as <output>
  .then -> core.get ref
  .then (output) ->

    # Check if <input> equals <output>
    t.deepEqual (input * factor), output, "Value multiplied successfully"

  # Catch and report errors
  .catch t.error

tests.push -> test 'Divide', (t) ->

  t.plan 1
  t.timeoutAfter 5000

  ref = baseRef.child 'divide'
  input = 100
  factor = 10

  # Set value at <ref> to <input>
  core.set ref, input

  # Increment value at <ref>
  .then -> math.divide ref, factor

  # Get value at <ref> as <output>
  .then -> core.get ref
  .then (output) ->

    # Check if <input> equals <output>
    t.deepEqual (input / factor), output, "Value divided successfully"

  # Catch and report errors
  .catch t.error

tests.push -> test 'Increment', (t) ->

  t.plan 1
  t.timeoutAfter 5000

  ref = core.child baseRef, 'increment'
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

  # Catch and report errors
  .catch t.error

tests.push -> test 'Decrement', (t) ->

  t.plan 1
  t.timeoutAfter 5000

  ref = core.child baseRef, 'decrement'
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

  # Catch and report errors
  .catch t.error

tests.push -> test 'Multiple increments and decrements', (t) ->

  t.plan 1
  t.timeoutAfter 5000

  ref = core.child baseRef, 'multiple_increments'
  input = 0

  # Set value at <ref> to <input>
  core.set ref, input

  # Increment and decrement values at <ref> seven times
  .then ->
    math.increment ref    # 1
    math.increment ref    # 2
    math.increment ref    # 3
    math.increment ref    # 4
    math.increment ref    # 5
    math.decrement ref    # 4
    math.decrement ref    # 3
    math.decrement ref    # 2
    math.decrement ref    # 1

  # Get value at <ref> as <output>
  .then -> core.get ref
  .then (output) ->

    # Check if <input> + 5 equals <output>
    t.deepEqual (input + 1), output, "Values successfully incremented and decremented"

  # Catch and report errors
  .catch t.error


# async.parallel tests, -> console.log "done"
