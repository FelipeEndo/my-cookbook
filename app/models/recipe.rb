class Recipe < ApplicationRecord
  attr_accessor :recipe_cover
  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user
  validates :title, :recipe_type, :difficulty, :cook_time, :ingredients, :method, :cuisine, presence: true
  has_many :favorites
end
