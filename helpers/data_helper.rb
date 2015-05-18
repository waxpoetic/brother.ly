# Retrieves items from the middleman site data.
module DataHelper
  def markdown(source)
    source = '_Biography coming shortly..._' if source.blank?
    Tilt['markdown'].new { source }.render
  end

  def site_url
    data.site.url
  end

  def open_signups?
    data.site.splash_text.blank? && data.site.ticket_url.blank?
  end

  def tickets_available?
    data.site.ticket_url.present?
  end

  def live_event?
    data.site.live_event_url.present?
  end

  def page_class
    'page'
  end

  def page_name
    current_page.data.name || site_title
  end
end
