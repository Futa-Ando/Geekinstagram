class CreateWordHashes < ActiveRecord::Migration[6.1]
  def change
    create_table :word_hashes do |t|
      t.references :word, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
