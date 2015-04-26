module.exports = React.createClass
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
