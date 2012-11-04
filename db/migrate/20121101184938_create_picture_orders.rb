class CreatePictureOrders < ActiveRecord::Migration
  def change
    create_table :picture_orders do |t|
      t.string :user_id
      t.string :picture_id
      t.string :size
      t.integer :human_count
      t.boolean :gel, default: false
      t.string :image
      t.string :comments

      t.timestamps
    end
    add_index :picture_orders, :user_id
    add_index :picture_orders, :picture_id
  end
end
