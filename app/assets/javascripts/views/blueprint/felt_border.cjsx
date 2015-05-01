module.exports = React.createClass
  render: ->
    style = { top: @props.top + "mm" }
    <div className="blueprint-felt_border" style={style} />
