module ApplicationHelper
  def link_icon_to_edit(path)
    ViewHelpers::LinkIconTo.new.link_icon_to_edit(path)
  end
end
