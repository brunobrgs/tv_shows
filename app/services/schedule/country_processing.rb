module Schedule::CountryProcessing
  def process_country(show)
    country_data = extract_country_data(show)
    return if country_data.nil?

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

  private

  def extract_country_data(show)
    return show.dig("network", "country") if show["network"]
    return show.dig("webChannel", "country") if show["webChannel"]

    nil
  end

  def sync_country(code, attributes)
    country = Country.find_or_initialize_by(code: code)
    country.assign_attributes(attributes)
    country.save!
    country
  end
end
