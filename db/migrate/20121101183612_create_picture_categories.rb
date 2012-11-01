class CreatePictureCategories < ActiveRecord::Migration
  def change
    create_table :picture_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
