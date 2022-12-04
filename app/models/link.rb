class Link < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  def update_click_count
    self.clicks += 1
    self.save
  end
end
