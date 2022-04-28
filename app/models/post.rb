class Post < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: true
end
