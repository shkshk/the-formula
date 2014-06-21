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

  constructor: ->
    @params = _.merge({}, @constructor.DEFAULTS)

  configure: (params) ->
    _.merge(@params, params)
    for key, value of @params
      @params[key] = parseInt(value, 10)
    @

  calculate: ->
    feltDimensions = @_calculateFeltDimensions()
    {
      felt: feltDimensions
      leather: @_calculateLeatherDimensions(feltDimensions)
    }

  _calculateFeltDimensions: ->
    {
      width: @params.width + @params.depth + (2 * @params.margin) + @params.power
      height: (@params.height * 2) + @params.depth + @params.felt_depth + @params.vertical_power + @params.lug
    }

  _calculateLeatherDimensions: (felt) ->
    visibleHeight = (@params.height + @params.lug) * 0.66
    {
      width: felt.width - (2 * (@params.margin + @params.padding))
      height: visibleHeight + 10
      visibleHeight: visibleHeight
      smallHeight: visibleHeight - 18 # FIXME: why 18?
    }
