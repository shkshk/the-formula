_ = require('lodash')
Formula = require('../models/formula.coffee')

module.exports =
  el: '#the_formula'
  data:
    params: _.merge({}, Formula.DEFAULTS, { width: 59, height: 124, depth: 8 })
  computed:
    patterns: -> Formula.calculate(@params)
