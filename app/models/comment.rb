class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
#   validates :rating, presence: true
  #validates :description, presence: true, length: { minimum: 10 }
end
