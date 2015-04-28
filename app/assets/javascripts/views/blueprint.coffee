FeltPattern = require("./felt_pattern.coffee")
LeatherPattern = require("./leather_pattern.coffee")
FeltBorder = require("./felt_border.coffee")
LeatherPocket = require("./leather_pocket.coffee")

module.exports = React.createClass
  pocketData: ->
    leather = @props.patterns.leather
    leg = leather.visibleHeight - leather.smallHeight
    hypotenuse = Math.sqrt(Math.pow(leg, 2) + Math.pow(leather.width / 2, 2))
    angle = (Math.asin(leg / hypotenuse) / Math.PI) * 180

    { leg: leg, hypotenuse: hypotenuse, angle: angle }

  render: ->
    data = @props.patterns
    params = @props.params

    `<div className="blueprint-patterns">
      <FeltPattern pattern={data.felt}>
        <FeltBorder top={params.lug} />
        <FeltBorder top={(data.felt.height + params.lug) / 2} />

        <LeatherPattern pattern={data.leather} />
        <LeatherPocket leather={data.leather} pocket={this.pocketData()} />
      </FeltPattern>
     </div>`
