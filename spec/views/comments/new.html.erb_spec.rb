require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :word_id => 1,
      :description => "MyString",
      :status => 1
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input#comment_word_id[name=?]", "comment[word_id]"
      assert_select "input#comment_description[name=?]", "comment[description]"
      assert_select "input#comment_status[name=?]", "comment[status]"
    end
  end
end
