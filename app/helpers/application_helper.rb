module ApplicationHelper

  def app_title
    if Rails.env.staging?
      t 'app.title_staging'
    else
      t 'app.title'
    end
  end

  def display_when_present objects, &block
    if objects.any?
      capture &block
    else
      content_tag :p, t('text.empty'), class: 'py-3 text-secondary'
    end
  end

  def page_title &block
    content_tag :div, class: 'page-title' do
      capture &block
    end
  end

end
