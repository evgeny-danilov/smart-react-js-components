@ReactDateTimePickerNativeInput = createReactClass(

  componentDidMount: ->
    $input = $(@state.inputRef)

    isMobile = $(window).width() <= 480 || Modernizr.touchevents;

    if isMobile and Modernizr.inputtypes.date
      $input.attr 'type', 'datetime-local'
    else
      $input.attr 'type', 'text'
      $input.datetimepicker(format: 'DD/MM/YYYY - HH:mm', stepping: 1, sideBySide: true, useCurrent: false)

  getInitialState: ->
    return {
      attribute: @props.attribute,
      label: @props.label,
      value: @props.value,
    }

  render: ->
    _this = this

    input_params =
      ref: (input) -> _this.state.inputRef = input,
      className: 'form-control',
      name: @props.attribute,
      defaultValue: @props.value

    React.createElement('div', { className: 'input-group' },
      React.createElement('input', input_params, null),
      React.createElement('span', { className: 'input-group-addon' },
        React.createElement('span', { className: 'glyphicon glyphicon-calendar' }, null),
      ),
    )
)



