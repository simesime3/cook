class UserStorage < ApplicationRecord
  validates  :name, presence:  true
  validates  :user_id, presence: true
  validates  :category_id, presence: true

  belongs_to :user, foreign_key: :category_id
  belongs_to :category, foreign_key: :category_id

end
