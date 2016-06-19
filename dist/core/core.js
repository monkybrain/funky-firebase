var curry, getSnapshot, getValue, onEvent, pipeP, ref1;

ref1 = require('ramda'), curry = ref1.curry, pipeP = ref1.pipeP;


/* HELPERS */

getSnapshot = function(ref) {
  return ref.once('value');
};

getValue = function(snapshot) {
  return snapshot.val();
};

onEvent = function(ref, event, fn) {
  return ref.on(event, function(snapshot, prevChildKey) {
    return fn(getValue(snapshot), prevChildKey);
  });
};


/* CORE FUNCTIONS */

module.exports = {

  /* OPERATIONS */
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

  /* REFERENCES */
  child: curry(function(ref, path) {
    return ref.child(path);
  }),
  url: curry(function(ref) {
    return ref.toString();
  }),

  /* QUERIES */
  endAt: curry(function(value, ref) {
    return ref.endAt(value);
  }),
  startAt: curry(function(value, ref) {
    return ref.startAt(value);
  }),
  equalTo: curry(function(value, ref) {
    return ref.equalTo(value);
  }),
  limitToFirst: curry(function(num, ref) {
    return ref.limitToFirst(num);
  }),
  limitToLast: curry(function(num, ref) {
    return ref.limitToLast(num);
  }),
  orderByKey: curry(function(ref) {
    return ref.orderByKey();
  }),
  orderByValue: curry(function(ref) {
    return ref.orderByValue();
  }),

  /* EVENTS */
  onValue: curry(function(ref, fn) {
    return onEvent(ref, 'value', fn);
  }),
  onChildAdded: curry(function(ref, fn) {
    return onEvent(ref, 'child_added', fn);
  }),
  onChildChanged: curry(function(ref, fn) {
    return onEvent(ref, 'child_changed', fn);
  }),
  onChildMoved: curry(function(ref, fn) {
    return onEvent(ref, 'child_moved', fn);
  }),
  onChildRemoved: curry(function(ref, fn) {
    return onEvent(ref, 'child_removed', fn);
  })
};
