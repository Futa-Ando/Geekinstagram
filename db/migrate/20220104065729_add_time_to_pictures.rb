class AddTimeToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :time, :datetime
  end
end
