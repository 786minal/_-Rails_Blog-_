require 'rails_helper'

RSpec.describe Comment, type: :model do
 let(:subject) { create(:comment) }

 it 'verify article must exist' do
   expect(subject.article.present?).to be_truthy
 end

  it 'not valid without commenter' do
    expect(subject.commenter.present?).to be_truthy
  end

 it 'not valid without description' do
   expect(subject.description.present?).to be_truthy
 end
 it 'description must be at least 10 chars long' do
   expect(subject.description.length).to  have_attributes(size: (be < 10)) 
 end
 
end