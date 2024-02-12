class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true

  validate :cpf, :validate_cpf

  private

  def validate_cpf
    errors.add :cpf, "is invalid" unless CPF.valid?(cpf)
  end
  
end
