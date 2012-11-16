class CreatePictureOrderCalcs < ActiveRecord::Migration
  def change
    create_table :picture_order_calcs do |t|
      t.string :size
      t.string :frame
      t.string :human_count
      t.text :comments
      t.text :first_step
      t.text :second_step
      t.text :third_step
      t.text :greeting

      t.timestamps
    end
  end
end
