class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_category_id
      t.string :name
      t.string :image_path

      t.timestamps
    end
    add_index :pictures, :picture_category_id
    add_index :pictures, :name
  end
end
