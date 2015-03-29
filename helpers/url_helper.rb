# Add helpers for link_to
module UrlHelper
  def link_to_artist(name)
    text = ['<i class="icon-arrow-left arrow">&nbsp;</i>', name].join
    id = '#' + name.parameterize.underscore
    link_to text, id, class: 'inactive'
  end

  def link_to_icon(name, text, href, options = {})
    options[:class] ||= ''
    options[:class] += " icon-#{name.to_s.gsub('_', '-')}"
    link_to text, href, options
  end
end
