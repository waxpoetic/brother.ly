xml.instruct!
xml.urlset xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  sitemap.resources.select { |page|
    page.ext =~ /html/
  }.each do |page|
    xml.url do
      xml.loc URI.join(data.site.url, page.url)
      xml.lastmod File.mtime(page.source_file).iso8601
      xml.changefreq page.data.change_frequency || data.site.change_frequency
      xml.priority page.data.priority || data.site.priority
    end
  end
end
