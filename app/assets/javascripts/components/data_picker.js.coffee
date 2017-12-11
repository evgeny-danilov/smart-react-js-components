@ReactDataPickerNativeInput = createReactClass(

  componentDidMount: ->
    $input = $(@state.inputRef)
    $input.datepicker(format: 'dd/mm/yyyy', autoclose: true)

    # Add support for datepickers globally to use input[type=date]
    nativeDateFormat = /^\d{4}-\d{2}-\d{2}$/
    datepickerDateFormat = /^\d{2}\/\d{2}\/\d{2}$/

    isMobile = $(window).width() <= 480 || Modernizr.touchevents;

    val = $input.val()
    valMoment = undefined
    if nativeDateFormat.test(val)
      valMoment = moment(val, 'YYYY-MM-DD')
    else if datepickerDateFormat.test(val)
      valMoment = moment(val, 'MM/DD/YY')

    isMoment = moment.isMoment(valMoment)
    if isMobile and Modernizr.inputtypes.date
      if isMoment
        val = valMoment.format('YYYY-MM-DD')
      $input.datepicker 'remove'
      $input.val val
      $input.attr 'type', 'date'
    else
      val = valMoment.format('MM/DD/YY') if isMoment
      $input.attr 'type', 'text'
      $input.val val

      if isMobile
        $input.datepicker 'remove'
      else
        if isMoment
          $input.datepicker 'update', valMoment.toDate()
        else
          $input.datepicker()

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



