React = require("react")
Felt = require("./felt.cjsx")
Leather = require("./leather.cjsx")
FeltBorder = require("./feltBorder.cjsx")
Pocket = require("./pocket.cjsx")

module.exports = React.createClass
  getPocketHeight: ->
    leather = @props.patterns.leather
    leather.visibleHeight - leather.smallHeight

  render: ->
    data = @props.patterns
    params = @props.params

    <div className="blueprint-patterns">
      <Felt width={data.felt.width} height={data.felt.height}>
        <FeltBorder top={params.lug} />
        <FeltBorder top={(data.felt.height + params.lug) / 2} />

        <Leather pattern={data.leather} />
        <Pocket width={data.leather.width}
          height={@getPocketHeight()}
          left={data.leather.left}
          bottom={data.leather.bottom} />
      </Felt>
     </div>
