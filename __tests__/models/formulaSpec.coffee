jest.autoMockOff()

Formula = require("../../app/assets/javascripts/models/formula")

describe "Formula", ->
  describe "#calculate", ->
    describe "when passed empty params", ->
      beforeEach ->
        @patterns = Formula.calculate()

      it "provides some default params", ->
        expect(@patterns.felt.width).toEqual(12)
        expect(@patterns.leather.width).toEqual(-2)

    describe "when passed non-empty params", ->
      beforeEach ->
        @patterns = Formula.calculate(width: 100, height: 150, depth: 10)

      it "calculates required felt pattern dimensions", ->
        felt = @patterns.felt
        expect(felt.width).toEqual(122)
        expect(felt.height).toEqual(323)

      it "calculates required leather pattern dimensions", ->
        leather = @patterns.leather
        expect(leather.width).toEqual(108)
        expect(leather.height).toEqual(114.28)
        expect(leather.visibleHeight).toEqual(104.28)
        expect(leather.smallHeight).toEqual(86.28)

      it "calculates leather pattern position", ->
        leather = @patterns.leather
        expect(leather.left).toEqual(7)
        expect(leather.bottom).toEqual(187.5)
