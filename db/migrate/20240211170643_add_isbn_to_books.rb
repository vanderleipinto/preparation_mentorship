class AddIsbnToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :isbn, :string
  end
end
