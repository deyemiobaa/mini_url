require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is valid with valid attributes" do
    link = Link.new(
      long_url: "https://www.google.com/this_is_my_custom_long_url", 
      short_url: "http://www.miniurl.com/short_url"
    )
    expect(link).to be_valid
  end

  it "is not valid without a long_url" do
    link = Link.new(
      long_url: nil, 
      short_url: "http://www.miniurl.com/short_url"
    )
    expect(link).to_not be_valid
  end

  it "is not valid without a short_url" do
    link = Link.new(
      long_url: "https://www.google.com/this_is_my_custom_long_url", 
      short_url: nil
    )
    expect(link).to_not be_valid
  end
end
