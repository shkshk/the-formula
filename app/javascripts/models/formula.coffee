_ = require('lodash')

module.exports = class Formula
  @DEFAULTS =
    width: 0
    height: 0
    depth: 0
    felt_depth: 3
    margin: 5
    padding: 2
    lug: 8
    power: 2
    vertical_power: 2

  @calculate: (params = {}) ->
    params = @_prepare(params)
    feltDimensions = @_calculateFeltDimensions(params)
    leatherDimensions = @_calculateLeatherParams(params, feltDimensions)
    { felt: feltDimensions, leather: leatherDimensions}

  @_prepare: (params) ->
    params = _.merge({}, @DEFAULTS, params)
    for key, value of params
      params[key] = parseInt(value, 10)
    params

  @_calculateFeltDimensions: (params) ->
    {
      width: params.width + params.depth + (2 * params.margin) + params.power
      height: (params.height * 2) + params.depth + params.felt_depth + params.vertical_power + params.lug
    }

  @_calculateLeatherParams: (params, felt) ->
    visibleHeight = (params.height + params.lug) * 0.66
    {
      width: felt.width - (2 * (params.margin + params.padding))
      height: visibleHeight + 10
      visibleHeight: visibleHeight
      smallHeight: visibleHeight - 18 # FIXME: why 18?
      left: params.margin + params.padding
      bottom: params.lug + (felt.height / 2) + 18
    }
