# funky-firebase

Simple functional wrapper for Firebase.

All functions curried to taste (with [Ramda](http://ramdajs.com/))

Uses promises for async operations

Poorly documented and far from complete :-)

## Methods

### Core functions

#### Operations (async/promise)

**get(ref)**

Resolves value at ref

**update(ref, data)**

Resolves when operation complete

**set(ref, data)**

Resolves when operation complete

**push(ref, data)**

Resolves when operation complete

**transaction(ref, fn)**

Resolves when operation complete

#### References (synchronous)

**child(ref, path)**

Returns ref to child

**url(ref)**

Returns absolute url (string) to ref

#### Events (async/callback)

**onValue(ref, callback(value))**

**onChildAdded(ref, callback(value, [prevChildKey]))**

**onChildChanged(ref, callback(value, [prevChildKey]))**

**onChildMoved(ref, callback(value, [prevChildKey]))**

**onChildRemoved(ref, callback(value, [prevChildKey]))**

_Examples_
```
# Set value at ref
set(ref, {key: 'value'});

# Get and print value at ref
get(ref).then(console.log)

# Print value at ref on change
onValue(ref, function(value) {
  console.log(value)
  });
```


### First order compositions

#### Mathematical operations

**add(ref, term)**

**subtract(ref, term)**

**multiply(ref, factor)**

**divide(ref, divisor)**

_Examples_
```
add(ref, 10)        # add 10 to value at ref
divide(ref, 10)     # divide value at ref by 10
```

### Second order compositions

#### Mathematical operations

**increment(ref)**

**decrement(ref)**

_Examples_

```
increment(ref)        # increment value at ref by 1
```
