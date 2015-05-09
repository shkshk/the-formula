React = require("react")

module.exports = React.createClass
  getStyle: ->
    data = @props.pattern

    {
      width: data.width + "mm"
      height: data.smallHeight + "mm"
      left: data.left + "mm"
      bottom: data.bottom + "mm"
    }

  getDataHeight: ->
    "#{@props.pattern.visibleHeight} (#{@props.pattern.height})"

  getDataWidth: ->
    @props.pattern.width

  render: ->
    <div className="blueprint-leather"
      style={@getStyle()}
      data-width={@getDataWidth()}
      data-height={@getDataHeight()} />
