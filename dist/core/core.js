var curry, getSnapshot, getValue, pipeP, ref1;

ref1 = require('ramda'), curry = ref1.curry, pipeP = ref1.pipeP;


/* HELPERS */

getSnapshot = function(ref) {
  return ref.once('value');
};

getValue = function(snapshot) {
  return snapshot.val();
};


/* CORE FUNCTIONS */

module.exports = {
  get: curry(pipeP(getSnapshot, getValue)),
  set: curry(function(ref, data) {
    return ref.set(data);
  }),
  update: curry(function(ref, data) {
    return ref.update(data);
  }),
  remove: curry(function(ref) {
    return ref.remove();
  }),
  push: curry(function(ref, data) {
    return ref.push(data);
  }),
  transaction: curry(function(ref, fn) {
    return ref.transaction(fn);
  }),
  onValue: curry(function(ref, fn) {
    return ref.on('value', function(snapshot) {
      return fn(getValue(snapshot));
    });
  })
};
