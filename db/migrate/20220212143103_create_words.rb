class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :word
      t.string :reading
      t.string :season
      t.text :detail

      t.timestamps
    end
  end
end
