class AddUrlToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :url, :string
  end
end
