class RenameNameColumnInBooks < ActiveRecord::Migration[7.1]
  def change
    rename_column :books, :name, :title
  end
end
