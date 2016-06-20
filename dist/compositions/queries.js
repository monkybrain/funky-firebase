var curry, equalTo, get, orderByChild, orderByKey, orderByValue, ref1;

curry = require('ramda').curry;

ref1 = require('../core/core'), get = ref1.get, equalTo = ref1.equalTo, orderByValue = ref1.orderByValue, orderByKey = ref1.orderByKey, orderByChild = ref1.orderByChild;

module.exports = {
  getByValue: curry(function(ref, value) {
    return get(equalTo(value, orderByValue(ref)));
  }),
  getByKey: curry(function(ref, key) {
    return get(equalTo(key, orderByKey(ref)));
  }),
  getByChild: curry(function(ref, path, value) {
    return get(equalTo(value, orderByChild(ref, path)));
  })
};
