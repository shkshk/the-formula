_ = require("lodash")
classnames = require("classnames")

Formula = require("../models/formula.coffee")
Blueprint = require("./blueprint.cjsx")

module.exports = React.createClass
  mixins: [React.addons.LinkedStateMixin]

  getInitialState: ->
    _.merge(
      {},
      Formula.DEFAULTS,
      { width: 59, height: 124, depth: 8 },
      { additionalParamsVisible: false }
    )

  toggleAdditionalParams: ->
    @setState(additionalParamsVisible: !@state.additionalParamsVisible)

  paramsClasses: ->
    classnames(
      "pseudo_link": true
      "pseudo_link--small": true
      "is-active": @state.additionalParamsVisible
    )

  additionalParamsClasses: ->
    classnames(
      "additional_params": true,
      "is-visible": @state.additionalParamsVisible
    )

  patterns: ->
    Formula.calculate(@state)

  render: ->
    <div id="the_formula" className="the_formula">
      <form className="the_formula-params">
        <fieldset className="main_params">
          <div>
            <label htmlFor="f-width">Ширина</label>
            <input type="text" id="f-width" valueLink={@linkState('width')} />
          </div>
          <div>
            <label htmlFor="f-height">Высота</label>
            <input type="text" id="f-height" valueLink={@linkState('height')} />
          </div>
          <div>
            <label htmlFor="f-depth">Толщина</label>
            <input type="text" id="f-depth" valueLink={@linkState('depth')} />
          </div>
        </fieldset>

        <div className="the_formula-params_drawer">
          <button type="button" className={@paramsClasses()} onClick={@toggleAdditionalParams}>
            Больше параметров
          </button>
        </div>

        <fieldset className={@additionalParamsClasses()}>
          <div>
            <label htmlFor="f-felt_depth">Толщина фетра</label>
            <input type="text" id="f-felt_depth" valueLink={@linkState('felt_depth')} />
          </div>
          <div>
            <label htmlFor="f-margin">От края до строчки</label>
            <input type="text" id="f-margin" valueLink={@linkState('margin')} />
          </div>
          <div>
            <label htmlFor="f-padding">От строчки до кожи</label>
            <input type="text" id="f-padding" valueLink={@linkState('padding')} />
          </div>
          <div>
            <label htmlFor="f-lug">«Язычок»</label>
            <input type="text" id="f-lug" valueLink={@linkState('lug')} />
          </div>
          <div>
            <label htmlFor="f-power">Постоянная Мощнуши</label>
            <input type="text" id="f-power" valueLink={@linkState('power')} />
          </div>
          <div>
            <label htmlFor="f-vertical_power">Вертикальная мощность</label>
            <input type="text" id="f-vertical_power" valueLink={@linkState('vertical_power')} />
          </div>
        </fieldset>
      </form>

      <Blueprint patterns={@patterns()} params={@state} />
    </div>
