# Supports cover images behind the site header.
module CoverImageHelper
  def cover
    if cover_image_exists?
      { style: "background-image: url(#{cover_image_path})" }
    else
      { class: 'no-cover' }
    end
  end

  private

  def cover_image_exists?
    current_page.data.cover.present?
  end

  def cover_image_path
    image_path current_page.data.cover
  end
end
