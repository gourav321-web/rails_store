class AddBookCountToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :books_count, :integer, default: 0
  end
end
