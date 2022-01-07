class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :Tittle, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
