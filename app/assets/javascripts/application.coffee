React = window.React = require("react/addons")
_ = require("lodash")
classnames = require("classnames")

Formula = require("./models/formula.coffee")

LeatherPattern = React.createClass
  render: ->
    data = @props.pattern
    style =
      width: data.width + "mm"
      height: data.smallHeight + "mm"
      left: data.left + "mm"
      bottom: data.bottom + "mm"

    `<div className="blueprint-leather"
      style={style}
      data-width={data.width}
      data-height={data.visibleHeight + '(' + data.height + ')'} />`

FeltPattern = React.createClass
  render: ->
    data = @props.pattern
    style =
      width: data.width + "mm"
      height: data.height + "mm"

    `<div className="blueprint-felt"
      style={style}
      data-width={data.width}
      data-height={data.height}>
        {this.props.children}
     </div>`

FormulaPattern = React.createClass
  render: ->
    data = @props.patterns

    `<div className="blueprint-patterns">
      <FeltPattern pattern={data.felt}>
        <LeatherPattern pattern={data.leather} />
      </FeltPattern>
     </div>`


FormulaParams = React.createClass
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
    `<div id="the_formula" className="the_formula">
      <form className="the_formula-params">
        <fieldset className="main_params">
          <div>
            <label htmlFor="f-width">Ширина</label>
            <input type="text" id="f-width" valueLink={this.linkState('width')} />
          </div>
          <div>
            <label htmlFor="f-height">Высота</label>
            <input type="text" id="f-height" valueLink={this.linkState('height')} />
          </div>
          <div>
            <label htmlFor="f-depth">Толщина</label>
            <input type="text" id="f-depth" valueLink={this.linkState('depth')} />
          </div>
        </fieldset>

        <div className="the_formula-params_drawer">
          <button type="button" className={this.paramsClasses()} onClick={this.toggleAdditionalParams}>
            Больше параметров
          </button>
        </div>

        <fieldset className={this.additionalParamsClasses()}>
          <div>
            <label htmlFor="f-felt_depth">Толщина фетра</label>
            <input type="text" id="f-felt_depth" valueLink={this.linkState('felt_depth')} />
          </div>
          <div>
            <label htmlFor="f-margin">От края до строчки</label>
            <input type="text" id="f-margin" valueLink={this.linkState('margin')} />
          </div>
          <div>
            <label htmlFor="f-padding">От строчки до кожи</label>
            <input type="text" id="f-padding" valueLink={this.linkState('padding')} />
          </div>
          <div>
            <label htmlFor="f-lug">«Язычок»</label>
            <input type="text" id="f-lug" valueLink={this.linkState('lug')} />
          </div>
          <div>
            <label htmlFor="f-power">Постоянная Мощнуши</label>
            <input type="text" id="f-power" valueLink={this.linkState('power')} />
          </div>
          <div>
            <label htmlFor="f-vertical_power">Вертикальная мощность</label>
            <input type="text" id="f-vertical_power" valueLink={this.linkState('vertical_power')} />
          </div>
        </fieldset>
      </form>

      <FormulaPattern patterns={this.patterns()} />
    </div>`

React.render(`<FormulaParams />`, document.getElementById("application-root"))
