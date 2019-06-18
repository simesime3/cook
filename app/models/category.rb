class Category < ApplicationRecord
  validates  :name, presence:  true, uniqueness: true

  has_one   :user_storage, primary_key: :id, foreign_key: :category_id
end
