React = require("react")
PureRenderMixin = require("react/addons").addons.PureRenderMixin

module.exports = React.createClass
  mixins: [PureRenderMixin]

  getInputId: ->
    "f-#{@props.name}"

  render: ->
    <div>
      <label htmlFor={@getInputId()}>{@props.title}</label>
      <input
        type="number"
        id={@getInputId()}
        name={@props.name}
        value={@props.value}
        onChange={@props.onChange} />
    </div>
