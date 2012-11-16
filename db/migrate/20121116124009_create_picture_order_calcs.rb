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
  PictureOrderCalc.create!(size: '30x40-210grn', frame: '1-75grn', human_count: '1-80grn', 		comments: 'additional options', first_step: 'First Step Text', second_step:
  'Second Step Text', third_step: 'Third Step Text', greeting:
  						'Congratulate with order creation')
  PictureOrderCalc.create!(size: '30x50-240grn', frame: '2-75grn', human_count: '2-160grn')
  end
end
