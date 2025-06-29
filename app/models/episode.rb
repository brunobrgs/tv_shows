class Episode < ApplicationRecord
  belongs_to :show

  validates :name, presence: true
  validates :season, presence: true, numericality: { greater_than: 0 }
  validates :url, presence: true
  validates :rating_average, numericality: { in: 0.0..10.0 }, allow_nil: true
  validates :runtime, numericality: { greater_than: 0 }, allow_nil: true

  scope :by_airstamp, -> (start_date, end_date) do
    where("date(airstamp) >= ? AND date(airstamp) <= ?", start_date, end_date)
  end
end
