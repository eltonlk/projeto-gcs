module FormsHelper

  def form_actions form_builder, cancel_url: nil
    content_tag :div, class: 'form-actions' do
      content = form_builder.button :submit

      if cancel_url.present?
        content << " "
        content << t('text.or').downcase
        content << " "
        content << link_to(t('text.cancel'), cancel_url, class: 'text-danger')
      end

      content
    end
  end

end
