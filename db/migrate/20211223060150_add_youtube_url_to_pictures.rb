class AddYoutubeUrlToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :youtube_url, :string
  end
end
