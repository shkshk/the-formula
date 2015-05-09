React = require("react")
PureRenderMixin = require("react/addons").addons.PureRenderMixin
Felt = require("./felt")
Leather = require("./leather")
FeltBorder = require("./feltBorder")
Pocket = require("./pocket")

module.exports = React.createClass
  mixins: [PureRenderMixin]

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

        <Leather
          width={data.leather.width}
          height={data.leather.height}
          smallHeight={data.leather.smallHeight}
          visibleHeight={data.leather.visibleHeight}
          left={data.leather.left}
          bottom={data.leather.bottom} />

        <Pocket
          width={data.leather.width}
          height={@getPocketHeight()}
          left={data.leather.left}
          bottom={data.leather.bottom} />
      </Felt>
     </div>
