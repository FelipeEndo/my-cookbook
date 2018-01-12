class Recipe < ApplicationRecord
  attr_accessor :recipe_cover
  belongs_to :cuisine
  belongs_to :recipe_type
  validates :title, :recipe_type, :difficulty, :cook_time, :ingredients, :method, :cuisine, presence: true
end
