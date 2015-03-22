module DataHelper
  def site_title
    data.site.title
  end

  def site_description
    data.site.description
  end

  def open_signups?
    !!data.site.open_signups
  end

  def live_event?
    !!data.site.live_event
  end
end
