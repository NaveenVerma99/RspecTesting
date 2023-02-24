require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  let(:comment) {
    Comment.create!(
      post_id: 1,
      body: "MyText"
    )
  }

  before(:each) do
    assign(:comment, comment)
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(comment), "post" do

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "textarea[name=?]", "comment[body]"
    end
  end
end
