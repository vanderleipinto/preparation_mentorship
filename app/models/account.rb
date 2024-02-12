class Account < ApplicationRecord
  belongs_to :supplier

  validates :account_number, presence: true
  validate :verify_digit, :calculate_verify_digit

  def calculate_verify_digit
    number = self.account_number
    weight = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5]
    sum = 0

    number.to_s.reverse.chars.each_with_index do |value, index|
      sum += value.to_i * weight[index % 12]
    end
      
    rest = sum % 11
    verify_digit = (rest < 2) ? 0 : (11 - rest)

    self.verify_digit = verify_digit.to_s
    verify_digit
  end
end
