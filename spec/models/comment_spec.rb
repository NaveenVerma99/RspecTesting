require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'when creating a comment' do 
    let(:post) {create :post}
    let (:comment) {create :comment, post_id: post.id}
    let (:comment1) {create :comment}
    it 'comment created' do
      expect(comment).to_not eq(nil)
    end
    it 'should raise active record exception if post is empty' do
      expect{comment1}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'when deleting a comment' do 
    let(:post1) {create :post}
    let!(:comment1) {create :comment, post_id: post1.id}
    let!(:comment2) {create :comment, post_id: post1.id}
    let!(:comment3) {create :comment, post_id: post1.id}

    it 'should destroy all comments' do
      expect(post1.comments.count).to eq(3)
      post1.destroy
      expect(post1.comments.count).to eq(0)
    end
  end
end
