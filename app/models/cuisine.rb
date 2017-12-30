class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: { message: "must be given please" }
  
end
