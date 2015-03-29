xml.instruct!
xml.urlset 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url do
    xml.loc data.site.url
    xml.lastmod File.mtime(File.expand_path('../index.html.haml', __FILE__)).iso8601
    xml.changefreq data.site.change_frequency
    xml.priority data.site.priority
  end
end
