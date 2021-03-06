class Recipe < ApplicationRecord
  has_many :need
  has_many :own

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
end
