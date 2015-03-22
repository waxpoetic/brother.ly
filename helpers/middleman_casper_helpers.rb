require 'ostruct'
require 'digest/md5'

# Helper methods for the Casper stuff within this project as well as
# titles.
module MiddlemanCasperHelpers
  def page_articles
    []
  end

  def blog_article?
    false
  end

  def page_title
    return default_title unless current_page_title.present?
    [default_title, current_page_title].join(': ')
  end

  def page_description
    blog_settings.description
  end

  def site_url
    blog_settings.url
  end

  def page_class
    if blog_article? || current_page.data.layout == 'page'
      'post-template'
    elsif current_resource.metadata[:locals]['page_number'].to_i > 1
      'archive-template'
    else
      'home-template'
    end
  end

  def summary(article)
    summary_length = article.blog_options[:summary_length]
    Sanitize.fragment(article.summary(summary_length, ''))
  end

  def blog_author
    OpenStruct.new(casper[:author])
  end

  def blog_settings
    OpenStruct.new(casper[:blog])
  end

  def tag_page?
    current_resource.metadata[:locals]['page_type'] == 'tag'
  end

  def tags?(article = current_article)
    article.tags.present?
  end

  def tags(article = current_article, separator = ', ')
    capture_haml do
      article.tags.each do |tag|
        haml_tag(:a, tag, href: tag_path(tag))
        haml_concat(separator) unless article.tags.last == tag
      end
    end.gsub("\n", '')
  end

  def current_article_url
    URI.join(blog_settings.url, current_article.url)
  end

  def cover
    if (src = current_page.data.cover).present?
      { style: "background-image: url(#{image_path(src)})" }
    else
      { class: 'no-cover' }
    end
  end

  def cover?
    current_page.data.cover.present?
  end

  def gravatar(size = 68)
    md5 = Digest::MD5.hexdigest(blog_author.gravatar_email.downcase)
    "https://www.gravatar.com/avatar/#{md5}?size=#{size}"
  end

  def gravatar?
    blog_author.gravatar_email.present?
  end

  def twitter_url
    "https://twitter.com/share?text=#{current_article.title}" \
      "&amp;url=#{current_article_url}"
  end

  def facebook_url
    "https://www.facebook.com/sharer/sharer.php?u=#{current_article_url}"
  end

  def google_plus_url
    "https://plus.google.com/share?url=#{current_article_url}"
  end

  def current_page_url
    "#{current_page.url}"
  end

  def feed_path
    if is_tag_page?
      "#{current_page_url}feed.xml"
    else
      '/feed.xml'
    end
  end

  def home_path
    '/'
  end

  def author_path
    "/author/#{blog_author.name.parameterize}/"
  end

  private

  def default_title
    blog_settings.name
  end

  def current_page_title
    tag_page_title || article_page_title || custom_page_title
  end

  def tag_page_title
    current_resource.metadata[:locals]['tagname'] if tag_page?
  end

  def article_page_title
    current_page.data.title if blog_article?
  end

  def custom_page_title
    current_page.data.title
  end
end
