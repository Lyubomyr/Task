# Set the host name for URL creation
# Use rake sitemap:refresh

#SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.default_host = "http://www.diem.com.ua"

SitemapGenerator::Sitemap.create do
  #add_to_index '/mysitemap1.xml.gz'
  add '/picture_orders/new'
  Page.find_each do |page|
    add page_path(page), :lastmod => page.updated_at
  end

  Picture.find_each do |picture|
      loc = "photo_pictures/" + picture.photo_picture.name + '/' + picture.slug
      img_loc = "http://www.diem.com.ua" + picture.image
      add(loc, :images => [{:loc => img_loc, :title => picture.title }])
  end
end
