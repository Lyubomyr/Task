# -*- encoding : utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create static pages
Page.delete_all
Page.create(name: 'home', content: 'Text', permalink: 'home')
Page.create(name: 'about', content: 'Text', permalink: 'about')
Page.create(name: 'contacts', content: 'Text', permalink: 'contacts')

#Set to DB all picture categories
PhotoPicture.delete_all
Dir.glob('public/assets/pictures/*').each do |category_path|
	PhotoPicture.create(name: category_path.from(23))
end

#Set to DB all pictures
Picture.delete_all
PhotoPicture.all.each do |category|
	files_path = Dir.glob("public/assets/pictures/#{category.name}/*")
	image_path = ''
	name = ''
	files_path.each do |path|
		image_path = path.from(14)
		name = path[/[^\/]+\./].to(-2)

		Picture.create({photo_picture_id: category.id, name: name,
		image: image_path, title: name, alt: name, text: name },
		without_protection: true)
	end
end
