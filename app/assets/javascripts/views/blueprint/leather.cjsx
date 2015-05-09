React = require("react")
PureRenderMixin = require("react/addons").addons.PureRenderMixin

module.exports = React.createClass
  mixins: [PureRenderMixin]

  getStyle: ->
    width: @props.width + "mm"
    height: @props.smallHeight + "mm"
    left: @props.left + "mm"
    bottom: @props.bottom + "mm"

  getDataHeight: ->
    "#{@props.visibleHeight} (#{@props.height})"

  getDataWidth: ->
    @props.width

  render: ->
    <div className="blueprint-leather"
      style={@getStyle()}
      data-width={@getDataWidth()}
      data-height={@getDataHeight()} />
