class Path < ApplicationRecord
  validates :value, presence: true, uniqueness: true
end
