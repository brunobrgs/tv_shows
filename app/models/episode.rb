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

  scope :by_network_name, -> (network_name) do
    joins(show: :network).where("networks.name = ?", network_name)
  end

  scope :by_country_code, -> (country_code) do
    joins(show: {network: :country}).where("countries.code = ?", country_code)
  end
end
