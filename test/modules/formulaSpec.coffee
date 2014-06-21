Formula = require('../../app/assets/javascripts/modules/formula')

describe 'Formula', ->
  beforeEach ->
    @formula = new Formula()

  describe '#constructor', ->
    it 'provides default params', ->
      expected =
        width: 0
        height: 0
        depth: 0
        felt_depth: 3
        margin: 5
        padding: 2
        lug: 8
        power: 2
        vertical_power: 2

      expect(@formula.params).toEqual(expected)

  describe '#configure', ->
    it 'changes formula parameters', ->
      expected =
        width: 22
        height: 44
        depth: 66
        felt_depth: 200
        margin: 5
        padding: 2
        lug: 80
        power: 2
        vertical_power: 2

      @formula.configure(width: 22, height: 44, depth: 66, felt_depth: '200', lug: 80)

      expect(@formula.params).toEqual(expected)

  describe '#calculate', ->
    beforeEach ->
      @formula.configure(width: 100, height: 150, depth: 10)
      @result = @formula.calculate()

    describe 'felt', ->
      it 'calculates required felt pattern dimensions', ->
        felt = @result.felt
        expect(felt.width).toEqual(122)
        expect(felt.height).toEqual(323)

    describe 'leather', ->
      it 'calculates required leather patter dimensions', ->
        leather = @result.leather
        expect(leather.width).toEqual(108)
        expect(leather.height).toEqual(114.28)
        expect(leather.visibleHeight).toEqual(104.28)
        expect(leather.smallHeight).toEqual(86.28)
