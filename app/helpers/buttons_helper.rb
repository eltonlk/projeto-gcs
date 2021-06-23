module ButtonsHelper

  def button_new new_url
    link_to t('text.new'), new_url, class: 'btn btn-primary'
  end

end
