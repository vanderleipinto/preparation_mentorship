class AddVerifyDigitToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :verify_digit, :string
  end
end
