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
    @

  calculate: ->
    feltDimensions = @_calculateFeltDimensions()
    {
      felt: feltDimensions
      leather: @_calculateLeatherDimensions(feltDimensions)
    }

  _calculateFeltDimensions: ->
    {
      width: @params.width + @params.depth + (2 * @params.constants.margin) + @params.constants.power
      height: (@params.height * 2) + @params.depth + @params.constants.felt_depth + @params.constants.vertical_power + @params.constants.lug
    }

  _calculateLeatherDimensions: (felt) ->
    visibleHeight = (@params.height + @params.constants.lug) * 0.66
    {
      width: felt.width - (2 * (@params.constants.margin + @params.constants.padding))
      height: visibleHeight + 10
      visibleHeight: visibleHeight
      smallHeight: visibleHeight - 18 # FIXME: why 18?
    }
