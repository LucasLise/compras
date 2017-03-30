class ViewHelpers::LinkIconTo
  include ActionView::Helpers
  include ActionView::Context
  include Rails.application.routes.url_helpers

  def link_icon_to(path, text, icon, options = {})
    link_class = options[:link_class]
    method = options[:method]
    data = options[:data]

    link_to content_tag(:i, '', class: 'fa fa-'+icon.to_s)+' '+text, path,
            class: link_class, method: method, data: data
  end

  def link_icon_to_edit(path)
    link_icon_to(path, 'Editar', 'edit', {link_class: 'btn btn-info btn-xs'})
  end

end
