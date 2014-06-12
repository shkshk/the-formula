describe 'Formula', ->
  describe '#foo', ->
    it 'returns x', ->
      f = new Formula(19)
      expect(f.foo()).toEqual(19)
