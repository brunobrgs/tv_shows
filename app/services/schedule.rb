# frozen_string_literal: true

class Schedule
  def self.upsert!
    new.upsert!
  end

  def upsert!
    start_date = Date.today
    end_date = Date.today

    (start_date..end_date).each do |date|
      raw_data = TvMaze.schedule_for(date)

      raw_data.each do |data|
        ActiveRecord::Base.transaction do
          show = data["show"]
          network = show["network"]
          next unless show && network

          country = find_or_create_country!(network["country"])
          upsert_network!(network, country) if country
        end
      end
    end
  end

  private

  def find_or_create_country!(country_data)
    return if country_data.blank?

    Country.find_or_create_by!(code: country_data["code"]) do |country|
      country.name = country_data["name"]
      country.timezone = country_data["timezone"]
    end
  end

  def upsert_network!(network_data, country)
    return if network_data.blank?

    network = Network.find_or_initialize_by(id: network_data["id"])
    network.assign_attributes(
      name: network_data["name"],
      country: country,
      official_site: network_data["officialSite"]
    )
    network.save!
    network
  end
end
