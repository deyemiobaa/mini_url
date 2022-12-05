require 'rails_helper'
require 'securerandom'

RSpec.describe "Link", type: :feature do
  it "is valid with valid attributes" do
    visit root_path
    fill_in "Long url", with: "https://www.google.com/this_is_my_custom_long_url"
    click_button "Create Link"
    expect(page).to have_content("Mini url was successfully created.")
  end

  it "is not valid without a long_url" do
    visit new_link_path
    fill_in "Long url", with: ""
    fill_in "Slug", with: SecureRandom.hex(Random.rand(5))
    click_button "Create Link"
    expect(page).to have_content("Long url can't be blank")
  end

  it "is not valid with existing slug" do
    Link.create!(long_url: "https://www.google.com/this_is_my_custom_long_url", slug: "same_slug")
    visit new_link_path
    fill_in "Long url", with: "https://www.google.com/this_is_my_custom_long_url"
    fill_in "Slug", with: "same_slug"
    click_button "Create Link"
    expect(page).to have_content("Slug has already been taken")
  end
end