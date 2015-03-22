module DataHelper
  def site_title
    data.site.title || data.site.site
  end

  def site_description
    data.site.description
  end

  def site_url
    data.site.url
  end

  def open_signups?
    !!data.site.open_signups
  end

  def live_event?
    !!data.site.live_event
  end

  def page_class
    'page'
  end
end
