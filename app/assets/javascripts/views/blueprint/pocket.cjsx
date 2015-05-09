React = require("react")

module.exports = React.createClass
  propTypes:
    width: React.PropTypes.number.isRequired
    height: React.PropTypes.number.isRequired
    left: React.PropTypes.number.isRequired
    bottom: React.PropTypes.number.isRequired

  getLeftBorderStyle: ->
    @borderStyle(@getAngle())

  getRightBorderStyle: ->
    @borderStyle(-@getAngle())

  borderStyle: (deg) ->
    width: @getHypotenuse() + "mm"
    bottom: @props.height + "mm"
    transform: "rotate(#{deg}deg)"

  getStyle: ->
    width: @props.width + "mm"
    height: @props.height + "mm"
    left: @props.left + "mm"
    bottom: (@props.bottom - @props.height) + "mm"

  getHypotenuse: ->
    Math.sqrt(Math.pow(@props.height, 2) + Math.pow(@props.width / 2, 2))

  getAngle: ->
    hypotenuse = @getHypotenuse()
    (Math.asin(@props.height / hypotenuse) / Math.PI) * 180

  render: ->
    <div className="blueprint-leather_pocket" style={@getStyle()}>
      <div className="pocket-border pocket-border--left" style={@getLeftBorderStyle()} />
      <div className="pocket-border pocket-border--right" style={@getRightBorderStyle()} />
     </div>
