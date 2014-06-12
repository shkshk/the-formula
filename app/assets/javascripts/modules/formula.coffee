_ = require('lodash')

module.exports = class Formula
  constructor: ->
    @params =
      width: 0
      height: 0
      depth: 0

  configure: (params) ->
    _.assign(@params, params)
