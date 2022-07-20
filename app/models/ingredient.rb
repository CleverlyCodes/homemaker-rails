class Ingredient < ApplicationRecord
  has_many :need
  has_many :item
end
