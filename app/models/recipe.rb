class Recipe < ApplicationRecord
  attr_accessor :recipe_cover
  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user
  validates :title, :recipe_type, :difficulty, :cook_time, :ingredients, :method, :cuisine, presence: true
  has_many :favorites
  
  has_attached_file :recipe_cover, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/assets/sem-foto.gif"
  validates_attachment_content_type :recipe_cover, content_type: /\Aimage\/.*\z/
  
  def user_owner?(user)
    self.user == user
  end
end
