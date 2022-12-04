require 'rails_helper'

RSpec.describe Path, type: :model do
  it "is valid with valid attributes" do
    path = Path.new(
      value: "this_is_my_custom_path"
    )
    expect(path).to be_valid
  end

  it "is not valid without a value" do
    path = Path.new(
      value: nil
    )
    expect(path).to_not be_valid
  end

  it "is not valid with a duplicate value" do
    path = Path.new(
      value: "this_is_my_custom_path"
    )
    path.save
    path2 = Path.new(
      value: "this_is_my_custom_path"
    )
    expect(path2).to_not be_valid
  end
end
