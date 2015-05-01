classnames = require("classnames")

module.exports = React.createClass
  getInitialState: -> { visible: false }

  toggleVisibility: ->
    @setState(visible: !@state.visible)

  togglerClasses: ->
    classnames(
      "pseudo_link": true
      "pseudo_link--small": true
      "is-active": @state.visible
    )

  fieldsetClasses: ->
    classnames(
      "additional_params": true
      "is-visible": @state.visible
    )

  recalculate: (event) ->
    input = event.target
    @props.onChange(input.name, input.value)

  render: ->
    <div>
      <div className="the_formula-params_drawer">
        <button type="button" className={@togglerClasses()} onClick={@toggleVisibility}>
          Больше параметров
        </button>
      </div>

      <fieldset className={@fieldsetClasses()}>
        <div>
          <label htmlFor="f-felt_depth">Толщина фетра</label>
          <input type="text"
            name="felt_depth"
            id="f-felt_depth"
            value={@props.felt_depth}
            onChange={@recalculate} />
        </div>

        <div>
          <label htmlFor="f-margin">От края до строчки</label>
          <input type="text"
            name="margin"
            id="f-margin"
            value={@props.margin}
            onChange={@recalculate} />
        </div>

        <div>
          <label htmlFor="f-padding">От строчки до кожи</label>
          <input type="text"
            name="padding"
            id="f-padding"
            value={@props.padding}
            onChange={@recalculate} />
        </div>

        <div>
          <label htmlFor="f-lug">«Язычок»</label>
          <input type="text"
            name="lug"
            id="f-lug"
            value={@props.lug}
            onChange={@recalculate} />
        </div>

        <div>
          <label htmlFor="f-power">Постоянная Мощнуши</label>
          <input type="text"
            name="power"
            id="f-power"
            value={@props.power}
            onChange={@recalculate} />
        </div>

        <div>
          <label htmlFor="f-vertical_power">Вертикальная мощность</label>
          <input type="text"
            name="vertical_power"
            id="f-vertical_power"
            value={@props.vertical_power}
            onChange={@recalculate} />
        </div>
      </fieldset>
    </div>
