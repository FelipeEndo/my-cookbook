class Recipe < ApplicationRecord
  attr_accessor :recipe_cover, :remote_image_url
  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user
  validates :title, :recipe_type, :difficulty, :cook_time, :ingredients, :method, :cuisine, presence: true
  has_many :favorites
  mount_uploader :recipe_cover, RecipeCoverUploader
  
  def user_owner?(user)
    self.user == user
  end
end
