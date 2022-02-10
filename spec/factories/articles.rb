FactoryBot.define do
  factory :article do |_article| 
    Tittle { Faker::Internet.user_name }
    description { 'That is the description' }
    user { create(:user) }
  end
end


