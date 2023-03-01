require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'when creating a post' do
    let(:post) {build :post}
    let(:post1) {create :post, body: nil}

    it 'should be a valid post with all attributes' do
      expect(post.valid?).to eq(true)
    end
    
    it 'should have system generated body if the body is nil' do
      expect(post1.body).to eq("This is a system generated body")
    end

    it 'should check the custom validation' do
      subject.title = 'not uppercase'
      subject.validate
      expect(subject.errors[:title]).to include("Title is not upper case")
    end
  end
end
