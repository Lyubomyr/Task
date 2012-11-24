class AddTNameToPhotoPictures < ActiveRecord::Migration
  def change
    add_column :photo_pictures, :t_name, :string
  end
end
