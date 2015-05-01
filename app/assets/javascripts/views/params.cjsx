module.exports = React.createClass
  recalculate: (event) ->
    input = event.target
    @props.onChange(input.name, input.value)

  render: ->
    <fieldset className="main_params">
      <div>
        <label htmlFor="f-width">Ширина</label>
        <input type="text"
          id="f-width"
          name="width"
          value={@props.width}
          onChange={@recalculate} />
      </div>

      <div>
        <label htmlFor="f-height">Высота</label>
        <input type="text"
          id="f-height"
          name="height"
          value={@props.height}
          onChange={@recalculate} />
      </div>

      <div>
        <label htmlFor="f-depth">Толщина</label>
        <input type="text"
          id="f-depth"
          name="depth"
          value={@props.depth}
          onChange={@recalculate} />
      </div>
    </fieldset>
