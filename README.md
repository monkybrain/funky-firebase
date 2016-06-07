# funky-firebase

Simple functional wrapper for Firebase.

All functions curried to taste (with [Ramda](http://ramdajs.com/))

Uses promises for async operations

Poorly documented and far from complete :-)

## Methods

### Core functions

- get (ref)
- update (ref, data)
- set (ref, data)
- push (ref, data)
- transaction (ref, fn)

Examples (CoffeeScript)

```
# Get value at ref and print to console
get ref
.then (value) -> console.log value        

# Set value at ref to provided data
set ref,                                  
  id: 0,
  name: 'John'

```




### Core compositions

Mathematical operations
- add (ref, data)
- subtract (ref, data)

Examples
```
add(ref, 20)        # add 10 to value at ref
```

### Next order compositions

Mathematical operations
- increment (ref)
- decrement (ref)

Examples

```
increment(ref)        # increment value at ref by 1
```
