Formula = require('../../app/assets/javascripts/modules/formula')

describe 'Formula', ->
  beforeEach ->
    @formula = new Formula()

  describe '#constructor', ->
    it 'provides default params', ->
      expect(@formula.params.width).toEqual(0)
      expect(@formula.params.height).toEqual(0)
      expect(@formula.params.depth).toEqual(0)

  describe '#configure', ->
    it 'changes formula parameters', ->
      @formula.configure(width: 22, height: 44, depth: 66)
      expect(@formula.params.width).toEqual(22)
      expect(@formula.params.height).toEqual(44)
      expect(@formula.params.depth).toEqual(66)
