# -*- encoding : utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Set to DB all categories of pictures
categories = ['Готовые работы','Мужские портреты','Женские портреты','Парные портреты','Групповые портреты','Репродукции картин']
PictureCategory.delete_all
categories.each_with_index do |category|
	PictureCategory.create(name: category)
end

#Set to DB all pictures
Picture.delete_all
PictureCategory.all.each do |category|
	files_path = Dir.glob("app/assets/images/pictures/#{category.name}/*")
	image_path = ''
	name = ''
	files_path.each do |path|
		image_path = path.from(18)
		name = path[/[^\/]+\./].to(-2)

		Picture.create({picture_category_id: category.id,
				name: name, image_path: image_path},
				without_protection: true)
	end
end
