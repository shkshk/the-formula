classnames = require("classnames")

module.exports = React.createClass
  classes: ->
    classnames(
      "pseudo_link": true
      "pseudo_link--small": true
      "is-active": @props.active
    )

  render: ->
    <div className="the_formula-params_drawer">
      <button type="button" className={@classes()} onClick={@props.onChange}>
        Больше параметров
      </button>
    </div>
