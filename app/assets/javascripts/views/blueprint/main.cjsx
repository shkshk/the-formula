Felt = require("./felt.cjsx")
Leather = require("./leather.cjsx")
FeltBorder = require("./feltBorder.cjsx")
Pocket = require("./pocket.cjsx")

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
      <Felt pattern={data.felt}>
        <FeltBorder top={params.lug} />
        <FeltBorder top={(data.felt.height + params.lug) / 2} />

        <Leather pattern={data.leather} />
        <Pocket leather={data.leather} pocket={@pocketData()} />
      </Felt>
     </div>
