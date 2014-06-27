_ = require('lodash')
Formula = require('../models/formula.coffee')

module.exports =
  el: '#the_formula'
  data:
    additionalParamsVisible: false
    params: _.merge({}, Formula.DEFAULTS, { width: 59, height: 124, depth: 8 })
  computed:
    patterns: -> Formula.calculate(@params)

    pocket: ->
      leather = @patterns.leather
      leg = leather.visibleHeight - leather.smallHeight
      hypotenuse = Math.sqrt(Math.pow(leg, 2) + Math.pow(leather.width / 2, 2))
      angle = (Math.asin(leg / hypotenuse) / Math.PI) * 180
      { leg: leg, hypotenuse: hypotenuse, angle: angle }
