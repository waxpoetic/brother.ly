# Add helpers for link_to
module UrlHelper
  def icon_tag(name)
    icon = if name == 'website'
             'globe'
           else
             name
           end
    content_tag :i, '&nbsp;', class: "fa fa-#{icon}"
  end

  def link_to_artist(name)
    text = ['<i class="icon-arrow-left arrow">&nbsp;</i>', name].join
    id = '#' + name.parameterize.underscore
    link_to text, id
  end

  def link_to_icon(name, text, href, options = {})
    options[:class] ||= ''
    options[:class] += " icon-#{name.to_s.gsub('_', '-')}"
    link_to text, href, options
  end
end
