module MenuHelper

  def menu_aliases
    {
      registrations: :user
    }
  end

  def menu_nav_item namespace, url
    item_html = { class: 'nav-item' }
    link_html = { class: 'nav-link' }
    link_text = t(namespace, scope: 'app.menu')

    if menu_nav_item_active? namespace
      link_html[:class] << ' active'
    end

    content_tag :li, item_html do
      link_to url, link_html do
        link_text
      end
    end
  end

  def menu_nav_item_active? namespace
    menu_aliases.fetch(controller_name.to_sym, controller_name.to_sym) == namespace.to_sym
  end

  def menu_nav_item_dropdown namespace, link_text, &block
    item_html = { class: 'nav-item dropdown' }
    link_html = { class: 'nav-link dropdown-toggle', id: "#{namespace}Dropdown", role: 'button', data: { 'bs-toggle': 'dropdown' }, aria: { expanded: false } }

    if menu_nav_item_active? namespace
      link_html[:class] << ' active'
    end

    content_tag :li, item_html do
      content = link_to '#', link_html do
        link_text
      end

      content << capture(&block)
      content
    end
  end

end
