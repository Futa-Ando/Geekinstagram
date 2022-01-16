class AddDepthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :depth1, :string
    add_column :users, :depth2, :string
    add_column :users, :depth3, :string
    add_column :users, :depth4, :string
    add_column :users, :depth5, :string
    add_column :users, :depth6, :string
    add_column :users, :depth7, :string
    add_column :users, :depth8, :string
    add_column :users, :depth9, :string
    add_column :users, :depth10, :string
    add_column :users, :depth11, :string
    add_column :users, :depth12, :string
  end
end
