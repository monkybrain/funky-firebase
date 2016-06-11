
# Node Modules
# testP = require 'blue-tape'
test = require 'tape'
fs = require 'fs'
async = require 'async'
firebase = require 'firebase'

# My Modules
core = require '../../dist/core/core'

# Init firebase
firebase.initializeApp JSON.parse fs.readFileSync 'res/credentials.json', 'utf-8'

# Get ref
baseRef = firebase.database().ref('/funky-firebase')

# Init and populate array of tests
tests = []

tests.push -> test 'Set and get value', (t) ->

  ref = baseRef.child 'set_and_get'
  input = "fish fingers"

  # Set value at <ref> to <input>
  core.set ref, input

  # Get value at <ref> as <output>
  .then -> core.get ref
  .then (output) ->

    # Check if <input> equals <output>
    t.deepEqual input, output
    t.end()

  # Catch and report errors
  .catch (err) ->
    t.error
    t.end()

tests.push -> test 'Remove value', (t) ->

  ref = baseRef.child 'remove'

  core.remove ref
  .then -> core.get ref
  .then (output) ->
    t.deepEqual output, null
    t.end()
  .catch t.error

async.parallel tests
