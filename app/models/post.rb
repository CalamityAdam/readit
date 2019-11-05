class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :votes, presence: true
  validates :votes, numericality: { only_integer: true }
  has_many :comments
end
