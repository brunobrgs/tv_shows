# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :network, optional: true

  validates :name, presence: true
  validates :rating_average, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :runtime, numericality: { greater_than: 0 }, allow_nil: true
end

