module ApplicationHelper
  def link_icon_to_edit(path)
    link_icon_to(path, t('buttons.edit'), {link_class: 'btn btn-info btn-xs'})
  end

  def link_icon_to_show(path)
    link_icon_to(path, t('buttons.show'), {link_class: 'btn btn-default btn-xs'})
  end

  def link_icon_to_destroy(path)
    link_icon_to(path, t('buttons.delete'), {link_class: 'btn btn-danger btn-xs', data: {confirm: t('views.actions.confirm')}, method: 'delete'})
  end

  def link_icon_to_back(path)
    link_icon_to(path, t('buttons.back'), {link_class: 'btn btn-default'})
  end

  def save_button
    render 'shared/save_button'
  end

  private

  def link_icon_to(path, text, options = {})
    link_class = options[:link_class]
    method = options[:method]
    data = options[:data]
    link_to text, path, class: link_class, method: method, data: data
  end
end
