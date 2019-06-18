class Recipe < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true

  belongs_to :user, primary_key: :user_id, foreign_key: :id

  belongs_to :user
  has_one    :recipe_image

end
