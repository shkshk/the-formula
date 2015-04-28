FeltPattern = require("./felt_pattern.cjsx")
LeatherPattern = require("./leather_pattern.cjsx")
FeltBorder = require("./felt_border.cjsx")
LeatherPocket = require("./leather_pocket.cjsx")

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

    <div className="blueprint-patterns">
      <FeltPattern pattern={data.felt}>
        <FeltBorder top={params.lug} />
        <FeltBorder top={(data.felt.height + params.lug) / 2} />

        <LeatherPattern pattern={data.leather} />
        <LeatherPocket leather={data.leather} pocket={@pocketData()} />
      </FeltPattern>
     </div>
