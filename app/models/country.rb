# frozen_string_literal: true

class Country < ApplicationRecord
  validates :name, :timezone, presence: true
  validates :code, presence: true, length: { is: 2 }, uniqueness: true
end
