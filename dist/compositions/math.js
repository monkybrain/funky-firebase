var add, curry, decrement, get, increment, push, ref1, remove, set, subtract, transaction, update;

curry = require('ramda').curry;

ref1 = require('../core/core'), get = ref1.get, set = ref1.set, update = ref1.update, remove = ref1.remove, push = ref1.push, transaction = ref1.transaction;


/* First order compositions */

add = curry(function(ref, data) {
  var fn;
  fn = function(value) {
    return value + data;
  };
  return transaction(ref, fn);
});

subtract = curry(function(ref, data) {
  var fn;
  fn = function(value) {
    return value - data;
  };
  return transaction(ref, fn);
});


/* Second order compositions */

increment = add(1);

decrement = subtract(1);


/* EXPORTS */

module.exports = {
  add: add,
  subtract: subtract,
  increment: increment,
  decrement: decrement
};
