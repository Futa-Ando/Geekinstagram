class AddImpressionsCountToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :impressions_count, :integer, default: 0
  end
end
