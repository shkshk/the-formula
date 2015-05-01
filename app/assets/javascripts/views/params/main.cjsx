Input = require("./input.cjsx")

module.exports = React.createClass
  render: ->
    <fieldset className="main_params">
      <Input name="width" title="Ширина" value={@props.width} onChange={@props.onChange} />
      <Input name="height" title="Высота" value={@props.height} onChange={@props.onChange} />
      <Input name="depth" title="Толщина" value={@props.depth} onChange={@props.onChange} />
    </fieldset>
