FeltPattern = require("./felt_pattern.coffee")
LeatherPattern = require("./leather_pattern.coffee")
FeltBorder = require("./felt_border.coffee")

module.exports = React.createClass
  render: ->
    data = @props.patterns
    params = @props.params

    `<div className="blueprint-patterns">
      <FeltPattern pattern={data.felt}>
        <FeltBorder top={params.lug} />
        <FeltBorder top={(data.felt.height + params.lug) / 2} />

        <LeatherPattern pattern={data.leather} />
      </FeltPattern>
     </div>`
