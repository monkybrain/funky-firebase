{mergeAll} = require 'ramda'

core = require './core/core'
math = require './compositions/math'
queries = require './compositions/queries'

module.exports = mergeAll [core, math, queries]
