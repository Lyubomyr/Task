class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :photo_picture_id
      t.string :name
      t.string :image
      t.string :slug
      t.string :title
      t.string :alt
      t.text :text

      t.timestamps
    end
    add_index :pictures, :photo_picture_id
    add_index :pictures, :name
  end
end
