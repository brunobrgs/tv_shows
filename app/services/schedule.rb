class Schedule
  include CountryProcessing
  include NetworkProcessing

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

      process_country(show)
      process_network(show["network"])
    end
  end
end
