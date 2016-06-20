# Node Modules
test = require 'tape'
fs = require 'fs'
async = require 'async'
firebase = require 'firebase'

# My Modules
{pipe, curry, compose, pipe} = require 'ramda'
{child, get, set, orderByValue, orderByKey, orderByChild, limitToLast, limitToFirst, endAt, equalTo} = require '../../dist/core/core'
{getByKey, getByValue, getByChild} = require '../../dist/firebase'


# Init firebase
credentials = JSON.parse fs.readFileSync 'res/credentials.json', 'utf-8'
firebase.initializeApp credentials

# Get ref
baseRef = firebase.database().ref('/funky-firebase/core')

# Init and populate array of tests
tests = []

# TODO: Tidy up!

input =
  a: 30
  b: 20
  c: 20
  d: 20

# input =
#   a:
#     name:
#       firstName: 'John'
#       lastName: 'Smith'
#   b:
#     name:
#       firstName: 'Simon'
#       lastName: 'Olsson'
#   c:
#     name:
#       firstName: 'John'
#       lastName: 'Oliver'

users = child baseRef, 'users'
set users, [
  {name: 'Thor', email: 'thor@valhalla.is'}
  {name: 'Odin', email: 'admin@valhalla.is'}
]

getUserByEmail = getByChild users, 'email'
getUserByEmail 'admin@valhalla.is'
.then (result) -> console.log result.length
