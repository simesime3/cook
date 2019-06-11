class Category < ApplicationRecord
  validates  :name, presence:  true, uniqueness: true

  has_one   :my_page

end
