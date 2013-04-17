require 'spec_helper'

describe "comments/show" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :word_id => 1,
      :description => "Description",
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Description/)
    rendered.should match(/2/)
  end
end
