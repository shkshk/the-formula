_ = require("lodash")

Formula = require("../models/formula.coffee")
Blueprint = require("./blueprint.cjsx")
Params = require("./params.cjsx")
AdditionalParams = require("./additional_params.cjsx")

DEFAULT_IPHONE_DIMENSIONS =
  width: 59
  height: 124
  depth: 8

module.exports = React.createClass
  getInitialState: ->
    _.merge({}, Formula.DEFAULTS, DEFAULT_IPHONE_DIMENSIONS)

  patterns: ->
    Formula.calculate(@state)

  updateParam: (param, value) ->
    newState = {}
    newState[param] = value

    @setState(newState)

  render: ->
    <div id="the_formula" className="the_formula">
      <form className="the_formula-params">
        <Params onChange={@updateParam}
          width={@state.width}
          height={@state.height}
          depth={@state.depth} />

        <AdditionalParams onChange={@updateParam}
          felt_depth={@state.felt_depth}
          margin={@state.margin}
          padding={@state.padding}
          lug={@state.lug}
          power={@state.power}
          vertical_power={@state.vertical_power} />
      </form>

      <Blueprint patterns={@patterns()} params={@state} />
    </div>