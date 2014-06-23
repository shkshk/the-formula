Vue = require('vue')

describe 'Views.Formula', ->
  beforeEach ->
    setFixtures($('<div id="the_formula"></div>'))
    @formulaView = require('../../app/assets/javascripts/views/formula')
    @view = new Vue(@formulaView)

  describe 'data', ->
    it 'provides all parameters with default data', ->
      expected =
        width: 59
        height: 124
        depth: 8
        felt_depth: 3
        margin: 5
        padding: 2
        lug: 8
        power: 2
        vertical_power: 2

      expect(@view.params).toEqual(expected)

  describe 'patterns', ->
    describe 'felt', ->
      beforeEach ->
        @felt = @view.patterns.felt

      it 'returns computed felt pattern data', ->
        expect(@felt.width).toEqual(79)
        expect(@felt.height).toEqual(269)

    describe 'leather', ->
      beforeEach ->
        @leather = @view.patterns.leather

      it 'returns computed leather pattern data', ->
        expect(@leather.width).toEqual(65)
        expect(@leather.height).toEqual(97.12)

  describe 'pocket', ->
    beforeEach ->
      @pocket = @view.pocket

    it 'calculates pocket angle', ->
      expect(parseInt(@pocket.angle)).toEqual(28)

    it 'calculates pocket hypotenuse', ->
      expect(parseInt(@pocket.hypotenuse)).toEqual(37)

    it 'returns pocket leg', ->
      expect(@pocket.leg).toEqual(18)
