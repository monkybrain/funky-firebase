{curry} = require 'ramda'

{get, equalTo, orderByValue, orderByKey, orderByChild} = require '../core/core'

module.exports =

  getByValue: curry (ref, value) -> get equalTo(value, orderByValue(ref))

  getByKey: curry (ref, key) -> get equalTo(key, orderByKey(ref))

  getByChild: curry (ref, path, value) -> get equalTo(value, orderByChild(ref, path))
