{mergeAll} = require 'ramda'

core = require './core/core'
math = require './compositions/math'

module.exports = mergeAll [core, math]
