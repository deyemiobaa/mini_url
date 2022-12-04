require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        long_url: "Long Url",
        short_url: "Short Url",
        clicks: 2
      ),
      Link.create!(
        long_url: "Long Url",
        short_url: "Short Url",
        clicks: 2
      )
    ])
  end

  it "renders a list of links" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Long Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Short Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
