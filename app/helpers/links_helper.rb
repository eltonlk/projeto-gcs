module LinksHelper

  def link_to_delete delete_url
    link_to t('text.delete'), delete_url, class: 'text-danger'
  end

  def link_to_destroy destroy_url
    link_to t('text.destroy'), destroy_url, class: 'text-danger', method: :delete, data: { confirm: t('text.confirm') }
  end

  def link_to_edit edit_url
    link_to t('text.edit'), edit_url
  end

end
