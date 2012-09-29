module ApplicationHelper

  def full_title(title)
    siteTitle = "Finance App"
    if title.empty?
      siteTitle
    else
      "#{siteTitle} | #{title}"
    end
  end
end
