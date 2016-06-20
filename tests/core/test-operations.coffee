# Node Modules
test = require 'tape'
fs = require 'fs'
async = require 'async'
firebase = require 'firebase'
{pipe} = require 'ramda'

# My Modules
{get, set, update, push, remove, child} = require '../../dist/core/core'

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
  child: 'child'
  number: 10
  object:
    key: 'value'

getRef = child(baseRef)

1 - Set and get value
tests.push -> test 'Set and get value', (t) ->

  t.plan 1

  # Helper functions
  setValue = set getRef 'set_and_get'
  getValue = -> get getRef 'set_and_get'

  # Set value at ref
  setValue input.string

  # Get value at ref
  .then -> getValue()

  # TEST: Value at ref should equal input
  .then (value) -> t.deepEqual value, input.string

  # Catch and report errors
  .catch (err) -> t.error

# 2 - Remove value
tests.push -> test 'Remove value', (t) ->

  t.plan 1

  # Helpers
  ref = getRef 'remove'

  # Set value at ref to input
  set ref, input.string

  # Remove value at ref
  .then -> remove ref

  # Get value at ref
  .then -> get ref

  # TEST: Value at ref should be null
  .then (value) -> t.deepEqual value, null

  # Catch and report errors
  .catch t.error

async.parallel tests
