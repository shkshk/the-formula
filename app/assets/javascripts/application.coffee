Vue = require('vue')
Formula = require('./modules/formula.coffee')

window.the_formula = new Formula()

window.FormulaView = new Vue(
  el: '#the_formula'
  data:
    params: window.the_formula.configure(width: 59, height: 124, depth: 8).params
  computed:
    patterns: -> window.the_formula.configure(this.params).calculate()
)
