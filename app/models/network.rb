# frozen_string_literal: true

class Network < ApplicationRecord
  belongs_to :country

  validates :name, presence: true
end

