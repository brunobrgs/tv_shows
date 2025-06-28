class Schedule
  attr_reader :countries_data, :networks_data

  def self.upsert!
    new.upsert!
  end

  def initialize
    @countries_data = {}
    @networks_data = {}
  end

  def upsert!
    start_date = Date.today
    end_date = Date.today

    (start_date..end_date).each do |date|
      raw_data = TvMaze.schedule_for(date)
      process_raw_data(raw_data)
    end
  end

  private

  def process_raw_data(raw_data)
    raw_data.each do |data|
      show = data["show"]
      next unless show

      country = extract_country_data(show)
      process_country(country)
      process_network(show["network"])
    end
  end

  def extract_country_data(show)
    return show.dig("network", "country") if show["network"]
    return show.dig("webChannel", "country") if show["webChannel"]

    nil
  end

  def process_country(country_data)
    country_code = country_data["code"]
    return if countries_data[country_code]

    country = sync_country(country_code, {
      name: country_data["name"],
      timezone: country_data["timezone"]
    })

    countries_data[country_code] = {
      model: country,
      id: country.id
    }
  end

  def process_network(network_data)
    return if network_data.nil?

    network_id = network_data["id"]
    return if networks_data[network_id]

    networks_data[network_id] = true
    sync_network(
      network_id,
      name: network_data["name"],
      official_site: network_data["officialSite"],
      country_code: network_data["country"]["code"]
    )
  end

  def sync_country(code, attributes)
    country = Country.find_or_initialize_by(code: code)
    country.assign_attributes(attributes)
    country.save!
    country
  end

  def sync_network(id, attributes)
    network = Network.find_or_initialize_by(id: id)
    network.assign_attributes(
      name: attributes[:name],
      official_site: attributes[:official_site],
      country: countries_data[attributes[:country_code]][:model]
    )
    network.save!
    network
  end
end
