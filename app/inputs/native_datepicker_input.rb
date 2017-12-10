class NativeDatepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    component_options = {
      model: object_name,
      attribute: attribute_name,
      label: label_text,
      value: input_html_options[:value] || object.attributes[attribute_name.to_s],
    }
    template.react_component("ReactDataPickerNativeInput", component_options)
  end

end