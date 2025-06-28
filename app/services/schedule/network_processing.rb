module Schedule::NetworkProcessing
  def process_network(network_data)
    return if network_data.nil?

    network_id = network_data["id"]
    return if networks_data[network_id]

    network = sync_network(
      network_id,
      name: network_data["name"],
      official_site: network_data["officialSite"],
      country_code: network_data["country"]["code"]
    )
    networks_data[network_id] = network
  end

  private

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

