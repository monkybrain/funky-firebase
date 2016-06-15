# funky-firebase

Simple functional wrapper for Firebase.

All functions curried to taste (with [Ramda](http://ramdajs.com/))

Uses promises for async operations

Poorly documented and far from complete :-)



## Core functions

### Operations
Functions are asynchronous and return promises

**get(ref)**

Resolves with value at ref

**update(ref, data)**

Resolves when operation complete

**set(ref, data)**

Resolves when operation complete

**push(ref, data)**

Resolves when operation complete

**transaction(ref, fn)**

Resolves when operation complete

_Examples_
```
# Get and print value at ref
get(ref).then(console.log)

# Set value at ref
set(ref, {key: 'value'});
```

### References
Functions are synchronous

**child(ref, path)**

Returns ref to child

**url(ref)**

Returns absolute url (string) to ref

_Examples_
```
# Get ref to grandchild of base reference
grandChild = child(baseRef, '/child/grandchild');

# Get absolute url and print to console
console.log(url(grandChild)); # e.g. 'https://test.firebaseio.com/child/grandchild'
```

### Events (async/callback)
Functions are asynchronous and take callbacks as second parameter

**onValue(ref, callback(value))**

**onChildAdded(ref, callback(value, [prevChildKey]))**

**onChildChanged(ref, callback(value, [prevChildKey]))**

**onChildMoved(ref, callback(value, [prevChildKey]))**

**onChildRemoved(ref, callback(value, [prevChildKey]))**

```
# Print value at ref on change
onValue(ref, function(value) {
  console.log(value)
  });
```


## First order compositions

### Mathematical operations

**add(ref, term)**

Resolves when operation complete

**subtract(ref, term)**

Resolves when operation complete

**multiply(ref, factor)**

Resolves when operation complete

**divide(ref, divisor)**

Resolves when operation complete

_Examples_
```
add(ref, 10)        # add 10 to value at ref
divide(ref, 10)     # divide value at ref by 10
```

## Second order compositions

### Mathematical operations

**increment(ref)**

Resolves when operation complete

**decrement(ref)**

Resolves when operation complete

_Examples_

```
increment(ref)        # increment value at ref by 1
```
