class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pictures, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :Tittle, presence: true
  validates :description, presence: true, length: { minimum: 10 }
 
  def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    all
  end
end  
 
end
