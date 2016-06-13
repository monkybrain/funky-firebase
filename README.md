# funky-firebase

Simple functional wrapper for Firebase.

All functions curried to taste (with [Ramda](http://ramdajs.com/))

Uses promises for async operations

Poorly documented and far from complete :-)

## Methods

### Core functions

Actions
- get(ref)
  - resolves value at ref
- update(ref, data)
  - resolves when done
- set(ref, data)
  - resolves when done
- push(ref, data)
  - resolves when done
- transaction(ref, fn)
  - resolves when done

References
- child(ref, path)
  - returns ref to child
- url(ref)
  - returns absolute url (string)

Events
- onValue(ref, callback(value))
- onChildAdded(ref, callback(value, [prevChildKey]))
- onChildChanged(ref, callback(value, [prevChildKey]))
- onChildMoved(ref, callback(value, [prevChildKey]))
- onChildRemoved(ref, callback(value, [prevChildKey]))

Examples
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

Mathematical operations
- add(ref, term)
- subtract(ref, term)
- multiply(ref, factor)
- divide(ref, divisor)

Examples
```
add(ref, 10)        # add 10 to value at ref
divide(ref, 10)     # divide value at ref by 10
```

### Second order compositions

Mathematical operations
- increment(ref)
- decrement(ref)

Examples

```
increment(ref)        # increment value at ref by 1
```
