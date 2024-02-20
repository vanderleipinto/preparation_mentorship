class AddValueToParts < ActiveRecord::Migration[7.1]
  def change
    
    add_column :parts, :value, :decimal, precision: 8, scale: 2

  end
end
