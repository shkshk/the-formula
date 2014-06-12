_ = require('lodash')

module.exports = class Formula
  @DEFAULTS =
    width: 0
    height: 0
    depth: 0
    constants:
      felt_depth: 3
      margin: 5
      padding: 2
      lug: 8
      power: 2
      vertical_power: 2

  constructor: ->
    @params = _.merge({}, @constructor.DEFAULTS)

  configure: (params) ->
    _.merge(@params, params)
