class MyPage < ApplicationRecord
  validates :user_id, presence: true

  belongs_to :user
  has_many   :categories
  has_many   :materials
end
