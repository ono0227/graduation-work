module ApplicationHelper
  BASE_TITLE = "BIGBAG Store".freeze

  def full_title(full_title)
    full_title.blank? ? BASE_TITLE : "#{full_title} - #{BASE_TITLE}"
  end
end
