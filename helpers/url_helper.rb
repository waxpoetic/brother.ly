# Add helpers for link_to
module UrlHelper
  def link_to_icon(name, text, href, options = {})
    options[:class] ||= ''
    options[:class] += " icon-#{name}"
    link_to text, href, options
  end
end
