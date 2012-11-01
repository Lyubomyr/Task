class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mname
      t.string :surname
      t.string :email
      t.string :address
      t.integer :tel

      t.timestamps
    end
  end
end
