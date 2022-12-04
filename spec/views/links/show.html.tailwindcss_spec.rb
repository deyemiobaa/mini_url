require 'rails_helper'

RSpec.describe "links/show", type: :view do
  before(:each) do
    assign(:link, Link.create!(
      long_url: "Long Url",
      short_url: "Short Url",
      clicks: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Long Url/)
    expect(rendered).to match(/Short Url/)
    expect(rendered).to match(/2/)
  end
end
