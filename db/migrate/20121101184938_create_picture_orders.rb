class CreatePictureOrders < ActiveRecord::Migration
  def change
    create_table :picture_orders do |t|
      t.integer :picture_id
      t.string :size
      t.integer :human_count
      t.boolean :gel, default: false
      t.string :frame
      t.text :comments
      t.string :status, default: 'new'
      t.string :slug
	t.string :user_name
	t.string :user_mname
	t.string :user_surname
	t.string :user_email
	t.string :user_tel
	t.string :user_address


      t.timestamps
    end
    add_index :picture_orders, :status
    add_index :picture_orders, :picture_id
  end
end
