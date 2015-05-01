_ = require("lodash")

Formula = require("../models/formula.coffee")
Blueprint = require("./blueprint.cjsx")
Params = require("./params/main.cjsx")
AdditionalParams = require("./params/additional.cjsx")

DEFAULT_IPHONE_DIMENSIONS =
  width: 59
  height: 124
  depth: 8

module.exports = React.createClass
  getInitialState: ->
    _.merge({}, Formula.DEFAULTS, DEFAULT_IPHONE_DIMENSIONS)

  patterns: ->
    Formula.calculate(@state)

  recalculate: (event) ->
    input = event.target
    @updateParam(input.name, input.value)

  updateParam: (param, value) ->
    newState = {}
    newState[param] = value

    @setState(newState)

  render: ->
    <div id="the_formula" className="the_formula">
      <form className="the_formula-params">
        <Params onChange={@recalculate}
          width={@state.width}
          height={@state.height}
          depth={@state.depth} />

        <AdditionalParams onChange={@recalculate}
          felt_depth={@state.felt_depth}
          margin={@state.margin}
          padding={@state.padding}
          lug={@state.lug}
          power={@state.power}
          vertical_power={@state.vertical_power} />
      </form>

      <Blueprint patterns={@patterns()} params={@state} />
    </div>
