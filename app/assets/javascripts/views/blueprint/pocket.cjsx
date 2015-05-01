module.exports = React.createClass
  leftBorderStyle: (pocket) ->
    @borderStyle(pocket, pocket.angle)

  rightBorderStyle: (pocket) ->
    @borderStyle(pocket, -pocket.angle)

  borderStyle: (pocket, deg) ->
    width: pocket.hypotenuse + "mm"
    bottom: pocket.leg + "mm"
    transform: "rotate(#{deg}deg)"

  render: ->
    pocket = @props.pocket
    leather = @props.leather

    style =
      width: leather.width + "mm"
      height: pocket.leg + "mm"
      left: leather.left + "mm"
      bottom: (leather.bottom - pocket.leg) + "mm"

    <div className="blueprint-leather_pocket" style={style}>
      <div className="pocket-border pocket-border--left" style={@leftBorderStyle(pocket)} />
      <div className="pocket-border pocket-border--right" style={@rightBorderStyle(pocket)} />
     </div>
