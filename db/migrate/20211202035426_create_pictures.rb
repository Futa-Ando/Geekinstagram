class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.text :body

      t.timestamps
    end
  end
end
