class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.text :body
      t.integer :user_id
      t.string :image
      t.string :youtube_url
      t.integer :impressions_count, default: 0
      t.integer :level
      t.string :title
      t.string :video
      t.datetime :time
      t.string :pdf

      t.timestamps
    end
  end
end
