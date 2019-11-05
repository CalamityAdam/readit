class Comment < ApplicationRecord
  validates :body, presence: true
  validates :votes, presence: true
  validates :votes, numericality: { only_integer: true }
  belongs_to :post
end
