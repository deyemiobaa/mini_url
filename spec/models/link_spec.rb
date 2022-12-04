require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is valid with valid attributes" do
    link = Link.new(
      long_url: "https://www.google.com/this_is_my_custom_long_url", 
      slug: "regexslug"
    )
    expect(link).to be_valid
  end

  it "is not valid without a long_url" do
    link = Link.new(
      long_url: nil, 
      slug: "http23kk"
    )
    expect(link).to_not be_valid
  end

  it "is not valid without a short_url" do
    link = Link.new(
      long_url: "https://www.google.com/this_is_my_custom_long_url", 
      slug: nil
    )
    expect(link).to_not be_valid
  end
end
