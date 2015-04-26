module.exports = React.createClass
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
