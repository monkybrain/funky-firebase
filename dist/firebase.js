var core, math, mergeAll, queries;

mergeAll = require('ramda').mergeAll;

core = require('./core/core');

math = require('./compositions/math');

queries = require('./compositions/queries');

module.exports = mergeAll([core, math, queries]);
