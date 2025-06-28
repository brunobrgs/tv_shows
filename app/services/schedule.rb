# frozen_string_literal: true

class Schedule
  def self.upsert
    new.upsert
  end

  def upsert
    start_date = Date.today
    end_date = Date.today

    (start_date..end_date).each do |date|
      raw_data = TvMaze.schedule_for(date)

      raw_data.each do |data|
        next unless data["show"] && data["show"]["network"]

        find_or_create_country(data["show"]["network"]["country"])
      end
    end
  end

  private

  def find_or_create_country(country_data)
    return if country_data.blank?

    Country.find_or_create_by(code: country_data["code"]) do |country|
      country.name = country_data["name"]
      country.timezone = country_data["timezone"]
    end
  end
end
