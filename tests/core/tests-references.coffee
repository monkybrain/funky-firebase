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
path = '/funky-firebase/core'
baseRef = firebase.database().ref(path)

# Init and populate array of tests
tests = []

# Test values
input =
  string: "Come on you irons!"
  child: 'child'
  number: 10
  object:
    key: 'value'

# 1 - Absolute url
tests.push -> test 'Absolute url from ref', (t) ->

  t.plan 1

  t.deepEqual core.url(baseRef), credentials.databaseURL + path, "Returned the correct absolute url"

async.parallel tests
