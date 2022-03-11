class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :pictures, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
#   validates :rating, presence: true
  #validates :description, presence: true, length: { minimum: 10 }
end
