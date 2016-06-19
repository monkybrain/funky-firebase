# Node Modules
test = require 'tape'
fs = require 'fs'
async = require 'async'
firebase = require 'firebase'

# My Modules
{pipe, curry, compose} = require 'ramda'
{child, get, set, orderByValue, orderByKey, limitToLast, equalTo} = require '../../dist/core/core'

# Init firebase
credentials = JSON.parse fs.readFileSync 'res/credentials.json', 'utf-8'
firebase.initializeApp credentials

# Get ref
baseRef = firebase.database().ref('/funky-firebase/core')

# Init and populate array of tests
tests = []

# Test values
# input =
#   a: 3
#   b: 2
#   c: 1

input =
  a: 30
  b: 20
  c: 20

ref = child baseRef, 'orderByValue'
# set ref, input
query = pipe orderByKey, equalTo("b")
# query = compose(limitToLast(1), orderByValue(ref))
get query(ref)
.then console.log

# 1 - onValue
# tests.push -> test 'Order By Value and limit', (t) ->
#
#   t.plan 1
#   getChildAndSetStartValue = pipe child('orderByKey')
#   console.log getChildAndSetStartValue(baseRef)
#
#
#   # Set value at ref to input
#   core.set ref, input
#   # Attach callback to value change at ref
#   .then ->
#     # core.get(core.limitToLast(core.orderByValue(ref), 2))
#
#
#   .then (value) ->
#     console.log value
#     t.deepEqual value, {c: 1, b: 2}, "Successfully ordered by value and limited to last 2"

async.parallel tests
