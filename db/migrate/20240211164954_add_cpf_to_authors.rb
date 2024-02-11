class AddCpfToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :cpf, :string
  end
end
