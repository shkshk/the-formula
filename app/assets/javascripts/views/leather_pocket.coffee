module.exports = React.createClass
  leftBorderStyle: (pocket) ->
    width: pocket.hypotenuse + "mm"
    bottom: pocket.leg + "mm"
    "-webkit-transform": "rotate(#{pocket.angle}deg)"
    transform: "rotate(#{pocket.angle}deg)"

  rightBorderStyle: (pocket) ->
    width: pocket.hypotenuse + "mm"
    bottom: pocket.leg + "mm"
    "-webkit-transform": "rotate(#{-pocket.angle}deg)"
    transform: "rotate(#{-pocket.angle}deg)"

  render: ->
    pocket = @props.pocket
    leather = @props.leather

    style =
      width: leather.width + "mm"
      height: pocket.leg + "mm"
      left: leather.left + "mm"
      bottom: (leather.bottom - pocket.leg) + "mm"

    `<div className="blueprint-leather_pocket" style={style}>
      <div className="pocket-border pocket-border--left" style={this.leftBorderStyle(pocket)} />
      <div className="pocket-border pocket-border--right" style={this.rightBorderStyle(pocket)} />
     </div>`
