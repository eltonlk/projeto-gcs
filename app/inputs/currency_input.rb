class CurrencyInput < SimpleForm::Inputs::StringInput
  def input wrapper_options
    merged_input_options = merge_wrapper_options(input_currency_html_options, wrapper_options)

    template.content_tag :div, class: 'input-group' do
      text_currency + @builder.text_field(attribute_name, merged_input_options)
    end
  end

  def input_currency_html_options
    options = input_html_options
    options[:class].delete :currency
    options[:class] << :'currency-input'
    options
  end

  def text_currency
    template.content_tag :div, class: 'input-group-text' do
      template.concat icon_currency
    end
  end

  def icon_currency
    I18n.t('number.currency.format.unit')
  end
end
