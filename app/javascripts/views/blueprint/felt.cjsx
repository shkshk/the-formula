React = require("react")
PureRenderMixin = require("react/addons").addons.PureRenderMixin

module.exports = React.createClass
  mixins: [PureRenderMixin]

  getStyle: ->
    width: @props.width + "mm"
    height: @props.height + "mm"

  render: ->
    <div className="blueprint-felt"
      style={@getStyle()}
      data-width={@props.width}
      data-height={@props.height}>
        {@props.children}
     </div>
