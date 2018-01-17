class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :favorites
  has_many :recipes
  has_many :favorites_recipes, through: :favorites, source: :recipes
  
  def favorited?(recipe)
   favorites_recipes.include?(recipe)
  end
  
end
