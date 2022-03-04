class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :Tittle, presence: true
  validates :description, presence: true, length: { minimum: 10 }
   has_attached_file :image, styles: { medium: "150*150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    all
  end
end  
 
end
