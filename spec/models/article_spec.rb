require 'rails_helper'

RSpec.describe Article, type: :model do
 let(:subject) { create(:article) }

 it 'verify user must exist' do
   expect(subject.user.present?).to be_truthy
 end

  it 'not valid without tittle' do
    expect(subject.Tittle.present?).to be_truthy
  end

 it 'not valid without description' do
   expect(subject.description.present?).to be_truthy
 end
 it 'description must be at least 10 chars long' do
   expect(subject.description.length).to  have_attributes(size: (be < 10)) 
 end
 #validates :description, presence: true, length: { 10 }
 #it 'description must be at least 10 chars long' do
#    should validate_length_of(:subject.description).  is_at_least(15).
# end
end
