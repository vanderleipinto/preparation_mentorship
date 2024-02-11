class Supplier < ApplicationRecord
  has_one :account

  has_many :parts, dependent: :destroy
  validates :name, presence: true
  validates :cnpj, presence: true, uniqueness: true

  validate :cnpj, :validate_cnpj

  private 

  def validate_cnpj
     errors.add(:cnpj, "invalid cnpj") unless CNPJ.valid?(cnpj)
  end

end
