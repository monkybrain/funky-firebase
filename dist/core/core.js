var curry, getSnapshot, getValueFromSnapshot, pipeP, ref1;

ref1 = require('ramda'), curry = ref1.curry, pipeP = ref1.pipeP;


/* HELPERS */

getSnapshot = function(ref) {
  return ref.once('value');
};

getValueFromSnapshot = function(snapshot) {
  return snapshot.val();
};


/* CORE FUNCTIONS */

module.exports = {
  get: curry(pipeP(getSnapshot, getValueFromSnapshot)),
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
  on: curry(function(ref, event, fn) {
    return ref.on(event, function(s) {
      return fn(getValueFromSnapshot(s));
    });
  })
};
