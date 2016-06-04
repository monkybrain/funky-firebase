var add, curry, decrement, get, getSnapshot, getValueFromSnapshot, increment, pipeP, push, ref1, remove, set, subtract, transaction, update;

ref1 = require('ramda'), curry = ref1.curry, pipeP = ref1.pipeP;


/* HELPERS */

getSnapshot = function(ref) {
  return ref.once('value');
};

getValueFromSnapshot = function(snapshot) {
  return snapshot.val();
};


/* CORE FUNCTIONS */

get = curry(pipeP(getSnapshot, getValueFromSnapshot));

update = curry(function(ref, data) {
  return ref.update(data);
});

set = curry(function(ref, data) {
  return ref.set(data);
});

remove = curry(function(ref) {
  return ref.remove();
});

push = curry(function(ref, data) {
  return ref.push(data);
});

transaction = curry(function(ref, fn) {
  return ref.transaction(fn);
});


/* CORE COMPOSITIONS */

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


/* HIGHER LEVEL COMPOSITIONS */

increment = add(1);

decrement = subtract(1);


/* EXPORTS */

module.exports = {
  get: get,
  set: set,
  update: update,
  remove: remove,
  push: push,
  increment: increment,
  decrement: decrement,
  add: add,
  subtract: subtract
};
