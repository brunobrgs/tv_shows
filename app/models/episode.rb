class Episode < ApplicationRecord
  belongs_to :show

  validates :name, presence: true
  validates :season, presence: true, numericality: { greater_than: 0 }
  validates :url, presence: true
  validates :rating_average, numericality: { in: 0.0..10.0 }, allow_nil: true
  validates :runtime, numericality: { greater_than: 0 }, allow_nil: true
end
