class Recipe < ApplicationRecord
  attr_accessor :recipe_cover
  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user
  validates(:title,
            :recipe_type,
            :difficulty,
            :cook_time,
            :ingredients,
            :method,
            :cuisine,
            presence: true)

  has_many :favorites, dependent: :destroy

  has_attached_file(:recipe_cover,
                    styles: { large: '500x500#',
                              medium: '300x300#',
                              thumb: '120x100#' },
                    default_url: '/assets/thumb/sem-foto.gif')
  validates_attachment_content_type(:recipe_cover,
                                    content_type: %r{/\Aimage\/.*\z/})

  def user_owner?(user)
    self.user == user
  end
end
