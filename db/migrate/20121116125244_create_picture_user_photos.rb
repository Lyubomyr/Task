class CreatePictureUserPhotos < ActiveRecord::Migration
  def change
    create_table :picture_user_photos do |t|
      t.integer :picture_order_id
      t.string :image

      t.timestamps
    end
    add_index :picture_user_photos, :picture_order_id
  end
end
