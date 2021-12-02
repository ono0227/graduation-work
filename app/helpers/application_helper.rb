module ApplicationHelper
  def full_title(full_title)
    base_title = "BIGBAG Store".freeze
    full_title.blank? ? base_title : "#{full_title} - #{base_title}"
  end
end
