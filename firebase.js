(function() {
  var add, decrement, get, getSnapshot, getValueFromSnapshot, increment, pipeP, push, remove, set, subtract, transaction, type, update, _ref;

  _ref = require('ramda'), pipeP = _ref.pipeP, type = _ref.type;


  /* HELPERS */

  getSnapshot = function(ref) {
    return ref.once('value');
  };

  getValueFromSnapshot = function(snapshot) {
    return snapshot.val();
  };


  /* BASIC FUNCTIONS */

  get = function(ref) {
    return getSnapshot(ref).then(getValueFromSnapshot);
  };

  update = function(ref, data) {
    return ref.update(data);
  };

  set = function(ref, data) {
    return ref.set(data);
  };

  remove = function(ref) {
    return ref.remove();
  };

  push = function(ref, data) {
    return ref.push(data);
  };

  transaction = function(ref, fn) {
    return ref.transaction(fn);
  };


  /* BASIC COMPOSITIONS */

  add = function(ref, data) {
    var fn;
    fn = function(value) {
      return value + data;
    };
    return transaction(ref, fn);
  };

  subtract = function(ref, data) {
    var fn;
    fn = function(value) {
      return value - data;
    };
    return transaction(ref, fn);
  };


  /* HIGHER LEVEL COMPOSITIONS */

  increment = function(ref) {
    return add(ref, 1);
  };

  decrement = function(ref) {
    return subtract(ref, 1);
  };

  module.exports = {
    get: get,
    set: set,
    update: update,
    remove: remove,
    push: push,
    increment: increment,
    decrement: decrement,
    add: add
  };

}).call(this);
