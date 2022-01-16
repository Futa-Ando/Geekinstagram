class AddLevelToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :level, :integer
  end
end
