module.exports = React.createClass
  render: ->
    inputId = "f-#{@props.name}"
    <div>
      <label htmlFor={inputId}>{@props.title}</label>
      <input type="text"
        id={inputId}
        name={@props.name}
        value={@props.value}
        onChange={@props.onChange} />
    </div>
