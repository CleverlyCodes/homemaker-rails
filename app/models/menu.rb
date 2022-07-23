class Menu < ApplicationRecord
  has_many :own

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
end
