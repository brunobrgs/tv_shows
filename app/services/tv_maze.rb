require 'net/http'

class TvMaze
  API_URL = "https://api.tvmaze.com/schedule".freeze

  def self.schedule_for(date)
    new.schedule_for(date)
  end

  def schedule_for(date)
    date = date.strftime("%Y-%m-%d")
    uri = URI("#{API_URL}?date=#{date}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
