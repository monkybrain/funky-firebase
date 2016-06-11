var core, math, mergeAll;

mergeAll = require('ramda').mergeAll;

core = require('./core/core');

math = require('./compositions/math');

module.exports = mergeAll([core, math]);

console.log(module.exports);
