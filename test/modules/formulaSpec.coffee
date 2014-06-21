Formula = require('../../app/assets/javascripts/modules/formula')

describe 'Formula', ->
  describe '#calculate', ->
    describe 'when passed empty params', ->
      beforeEach ->
        @results = Formula.calculate()

      it 'provides some default params', ->
        expect(@results.felt.width).toEqual(12)
        expect(@results.leather.width).toEqual(-2)

    describe 'when passed non-empty params', ->
      beforeEach ->
        @results = Formula.calculate(width: 100, height: 150, depth: 10)

      it 'calculates required felt pattern dimensions', ->
        felt = @results.felt
        expect(felt.width).toEqual(122)
        expect(felt.height).toEqual(323)

      it 'calculates required leather pattern dimensions', ->
        leather = @results.leather
        expect(leather.width).toEqual(108)
        expect(leather.height).toEqual(114.28)
        expect(leather.visibleHeight).toEqual(104.28)
        expect(leather.smallHeight).toEqual(86.28)
