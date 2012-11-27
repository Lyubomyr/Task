class AddPriceToPictureOrders < ActiveRecord::Migration
  def change
    add_column :picture_orders, :price, :string
  end
end
