class Recipe < ApplicationRecord
  has_many :need

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
end
