class Link < ApplicationRecord
  validates :long_url, presence: true, format: { with: URI.regexp }
  validates :slug, presence: true, uniqueness: true, length: { minimum: 3 }

  def update_click_count
    self.clicks += 1
    self.save
  end
end
