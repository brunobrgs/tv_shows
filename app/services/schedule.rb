class Schedule
  include CountryProcessing
  include NetworkProcessing
  include ShowProcessing
  include EpisodeProcessing

  attr_reader :countries_data, :networks_data, :shows_data, :episodes_data

  def self.upsert!
    new.upsert!
  end

  def initialize
    @countries_data = {}
    @networks_data = {}
    @shows_data = {}
    @episodes_data = {}
  end

  def upsert!
    start_date = Date.today
    end_date = 90.days.from_now

    (start_date..end_date).each do |date|
      Rails.logger.info "Processing schedule for #{date}"
      raw_data = TvMaze.schedule_for(date)
      process_raw_data(raw_data)
    end
  end

  private

  def process_raw_data(raw_data)
    raw_data.each do |data|
      show = data["show"]

      ActiveRecord::Base.transaction do
        process_country(show)
        process_network(show["network"])
        process_show(show)
        process_episode(data)
      end
    end
  end
end
