# more on https://github.com/plataformatec/simple_form/  ...look for "Custom inputs"

#app/inputs/custom_timepicker_input.rb
class CustomTimepickerInput < SimpleForm::Inputs::Base
  def input
    text_field_options = input_html_options.dup
    hidden_field_options = input_html_options.dup
    hidden_field_options[:class] = input_html_options[:class].dup # so they won't work with same array object

    text_field_options[:class] << 'timepicker-default input-small'

    hidden_field_options[:id] = "#{attribute_name}_hidden"

    return_string =
      "#{@builder.text_field(attribute_name, text_field_options)}\n" + 
      "<span class='add-on'>\n" + 
      "<i class='icon-time'></i>\n" + 
      "</span>"
    return return_string.html_safe
  end
end

# <div class="input-append bootstrap-timepicker-component">
#     <input type="text" class="timepicker-default input-small">
#     <span class="add-on">
#         <i class="icon-time"></i>
#     </span>
# </div>