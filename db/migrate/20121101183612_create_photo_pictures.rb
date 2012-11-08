class CreatePhotoPictures < ActiveRecord::Migration
  def change
    create_table :photo_pictures do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
