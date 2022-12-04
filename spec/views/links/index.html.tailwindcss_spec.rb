require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:link, Link.new)
    assign(:custom, false)
    assign(:links, [
      Link.create!(
        long_url: "Long Url",
        slug: "slug1",
        clicks: 2
      ),
      Link.create!(
        long_url: "Long Url",
        slug: "slug2",
        clicks: 2
      )
    ])
  end

  it "renders a list of links" do
    render
    cell_selector = 'td'
    assert_select cell_selector, text: Regexp.new("slug".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input[name=?]", "link[long_url]"
    end
  end
end
