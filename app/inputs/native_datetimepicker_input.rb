# Use in view:
#   f.input :attr, as: :native_datatimepicker

class NativeDatetimepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    component_options = {
      attribute: object_name + '[' + attribute_name.to_s + ']',
      label: label_text,
      value: input_html_options[:value] || object.attributes[attribute_name.to_s],
    }
    template.react_component("ReactDateTimePickerNativeInput", component_options)
  end

end