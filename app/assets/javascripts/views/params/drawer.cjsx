classnames = require("classnames")
React = require("react")
PureRenderMixin = require("react/addons").addons.PureRenderMixin

module.exports = React.createClass
  mixins: [PureRenderMixin]

  getClasses: ->
    classnames(
      "pseudo_link": true
      "pseudo_link--small": true
      "is-active": @props.active
    )

  render: ->
    <div className="the_formula-params_drawer">
      <button type="button" className={@getClasses()} onClick={@props.onChange}>
        Больше параметров
      </button>
    </div>
