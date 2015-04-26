FeltPattern = require("./felt_pattern.coffee")
LeatherPattern = require("./leather_pattern.coffee")

module.exports = React.createClass
  render: ->
    data = @props.patterns

    `<div className="blueprint-patterns">
      <FeltPattern pattern={data.felt}>
        <LeatherPattern pattern={data.leather} />
      </FeltPattern>
     </div>`
