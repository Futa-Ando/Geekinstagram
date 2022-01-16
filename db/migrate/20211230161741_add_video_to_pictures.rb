class AddVideoToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :video, :string
  end
end
