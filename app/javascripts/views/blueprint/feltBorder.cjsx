React = require("react")
PureRenderMixin = require("react/addons").addons.PureRenderMixin

module.exports = React.createClass
  mixins: [PureRenderMixin]

  getStyle: ->
    top: @props.top + "mm"

  render: ->
    <div className="blueprint-felt_border" style={@getStyle()} />
