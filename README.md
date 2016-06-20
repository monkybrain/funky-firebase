# funky-firebase

Simple functional wrapper for Firebase.

Why? Because _point-free_ composition > _pointless_ method chaining :-)

All functions curried to taste (using the excellent [ramda](http://ramdajs.com/) library)

Uses promises for async operations

Poorly documented and far from complete :-)

## Core functions

### Operations (asynchronous/promise)

**get(ref)**

Resolves with value

**update(ref, data)**

**set(ref, data)**

**push(ref, data)**

**transaction(ref, fn)**

_Examples_
```
# Get and print value at ref
get(ref).then(console.log);

# Set value at ref
set(ref, {key: 'value'});

# Partially apply 'set' function
updateScore = set(scoreRef);

# Use partially applied 'set' function
updateScore(10)
```

### References (synchronous)

**child(ref, path)**

Returns ref

**url(ref)**

Returns url string

_Examples_
```
# Get ref to grandchild of base reference
grandchild = child(baseRef, '/child/grandchild');

# Get absolute url and print to console
console.log(url(grandchild)); # e.g. 'https://test.firebaseio.com/child/grandchild'
```

### Events (asynchronous/callback)
Functions take callback as second argument

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

### Queries (synchronous)

To be documented

**orderByKey(ref, key)**

**orderByValue(ref, value)**

**orderByChild(ref, path, value)**

**startAt(value, ref)**

**endAt(value, ref)**

**equalTo(value, ref)**

**limitToFirst(num, ref)**

**limitToLast(num, ref)**




## First order compositions

### Mathematical operations (asynchronous/promise)

Functions return promises that resolve without arguments when operation complete

**add(ref, term)**

**subtract(ref, term)**

**multiply(ref, factor)**

**divide(ref, divisor)**

_Examples_
```
add(ref, 10)        # add 10 to value at ref
divide(ref, 10)     # divide value at ref by 10
```

### Queries (asynchronous)

Functions return promises that resolve with corresponding values

**getByKey(ref, key) -> value(s)**

**getByValue(ref, value)**

**getByChild(ref, path, value) -> value(s)**

_Examples_
```
### Get user by email address ###

# Get ref
users = child(ref, 'users');

# Set value at ref
set(users, [
  {name: 'Thor', email: 'thor@valhalla.is'},
  {name: 'Odin', email: 'admin@valhalla.is'}
}]);

# Partially apply 'getByChild' function
getUserByEmail = getByChild(users, 'email');

# Use partially applied 'getByChild' function
getUserByEmail('admin@valhalla.is')
.then(console.log)
```

## Second order compositions

### Mathematical operations

**increment(ref)**

Equivalent to `add(ref, 1)`

Resolves when operation complete

**decrement(ref)**

Equivalent to `subtract(ref, 1)`

Resolves when operation complete

_Examples_

```
increment(ref)        # increment value at ref by 1
```
