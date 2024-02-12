class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :assemblies

  validates :name, presence: true
  validate :isbn, :isbn_valid

  private

  def isbn_valid
    errors.add :isbn, "invalid isbn." unless ISBN.valid?(isbn)
  end
end
