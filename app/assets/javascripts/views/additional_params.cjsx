classnames = require("classnames")
Input = require("./input.cjsx")
Drawer = require("./params_drawer.cjsx")

module.exports = React.createClass
  getInitialState: -> { visible: false }

  toggleVisibility: ->
    @setState(visible: !@state.visible)

  fieldsetClasses: ->
    classnames(
      "additional_params": true
      "is-visible": @state.visible
    )

  render: ->
    <div>
      <Drawer active={@state.visible} onChange={@toggleVisibility} />

      <fieldset className={@fieldsetClasses()}>
        <Input name="felt_depth"
          title="Толщина фетра"
          value={@props.felt_depth}
          onChange={@props.onChange} />

        <Input name="margin"
          title="От края до строчки"
          value={@props.margin}
          onChange={@props.onChange} />

        <Input name="padding"
          title="От строчки до кожи"
          value={@props.padding}
          onChange={@props.onChange} />

        <Input name="lug"
          title="«Язычок»"
          value={@props.lug}
          onChange={@props.onChange} />

        <Input name="power"
          title="Постоянная Мощнуши"
          value={@props.power}
          onChange={@props.onChange} />

        <Input name="vertical_power"
          title="Вертикальная мощность"
          value={@props.vertical_power}
          onChange={@props.onChange} />
      </fieldset>
    </div>
