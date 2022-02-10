FactoryBot.define do
  factory :comment do |_comment| 
    commenter { Faker::Internet.user_name }
    description { 'This is the comment description' }
    article { create(:article) }
  end
end
