React = require("react")

module.exports = React.createClass
  getStyle: ->
    { top: @props.top + "mm" }

  render: ->
    <div className="blueprint-felt_border" style={@getStyle()} />
