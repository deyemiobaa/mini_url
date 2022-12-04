require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      long_url: "MyString",
      short_url: "MyString",
      clicks: 1
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input[name=?]", "link[long_url]"

      assert_select "input[name=?]", "link[short_url]"

      assert_select "input[name=?]", "link[clicks]"
    end
  end
end
