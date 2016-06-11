
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

value = 'fish fingers'

tests = []

tests.push -> test 'Set and get value', (t) ->

  ref = baseRef.child 'set_and_get'
  input = "fish fingers"

  # Set
  core.set ref, input
  # Get
  .then -> core.get ref
  # Check if equal
  .then (output) ->
    t.deepEqual input, output
    t.end()

tests.push -> test 'Remove value', (t) ->

  ref = baseRef.child 'remove'

  core.remove ref
  .then -> core.get ref
  .then (output) ->
    t.deepEqual output, null
    t.end()

async.parallel tests
