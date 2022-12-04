require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  let(:link) {
    Link.create!(
      long_url: "MyString",
      short_url: "MyString",
      clicks: 1
    )
  }

  before(:each) do
    assign(:link, link)
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(link), "post" do

      assert_select "input[name=?]", "link[long_url]"

      assert_select "input[name=?]", "link[short_url]"

      assert_select "input[name=?]", "link[clicks]"
    end
  end
end
