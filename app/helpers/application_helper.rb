module ApplicationHelper

  def app_title
    if Rails.env.staging?
      t 'app.title_staging'
    else
      t 'app.title'
    end
  end

end
