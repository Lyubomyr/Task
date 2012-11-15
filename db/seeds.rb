# -*- encoding : utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "RMagick"

#Create static pages
Page.delete_all
Page.create(name: 'home', content: 'Text', permalink: 'home')
Page.create(name: 'about', content: 'Text', permalink: 'about')
Page.create(name: 'contacts', content: 'Text', permalink: 'contacts')
Page.create(name: 'pictures', content: 'same for all pictures', permalink:
			'photo_pictures/category_name/picture_name')
Page.create(name: 'photo_pictures', content: 'photo_pictures', permalink:
							'photo_pictures')
Page.create(name: 'picture_orders', content: 'picture_orders', permalink:
						'picture_orders/new')

#Set to DB all picture categories
PhotoPicture.delete_all
Dir.glob('public/assets/pictures/*').each do |category_path|
	PhotoPicture.create(name: category_path.from(23))
end

#Set to DB all pictures
Picture.delete_all
PhotoPicture.all.each do |category|
	files_path = Dir.glob("public/assets/pictures/#{category.name}/*.[a-z]*")
	image_path = ''
	name = ''
	files_path.each do |path|
		image_path = path.from(14)
		name = path[/[^\/]+\./].to(-2)

		new_image = path[/^.*\//] + "mini/" + name + "-mini." + path[/[^\.]*$/]
		picture = Magick::Image.read(path).first
		picture = picture.resize_to_fit(200,10000)
		picture.write(new_image)

		Picture.create({photo_picture_id: category.id, name: name,
		image: image_path, image_mini: new_image.from(14), title: name, alt: name, text: name },
		without_protection: true)


	end
end
