var add, curry, decrement, divide, get, increment, multiply, push, ref1, remove, set, subtract, transaction, update;

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

multiply = curry(function(ref, data) {
  var fn;
  fn = function(value) {
    return value * data;
  };
  return transaction(ref, fn);
});

divide = curry(function(ref, data) {
  var fn;
  fn = function(value) {
    return value / data;
  };
  return transaction(ref, fn);
});


/* Second order compositions */

increment = curry(function(ref) {
  return add(ref, 1);
});

decrement = curry(function(ref) {
  return subtract(ref, 1);
});


/* EXPORTS */

module.exports = {
  add: add,
  subtract: subtract,
  multiply: multiply,
  divide: divide,
  increment: increment,
  decrement: decrement
};
