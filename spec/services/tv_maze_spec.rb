# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TvMaze do
  let(:date) { Date.today }

  before do
    sample_response = build(:tv_maze_response)
    url = URI("#{TvMaze::API_URL}?date=#{date.strftime('%Y-%m-%d')}")
    allow(Net::HTTP).to receive(:get).with(url).and_return(sample_response)
  end

  it 'returns a list with the scheduled shows' do
    data = described_class.schedule_for(date)

    expect(data[0]["id"]).to eq(1)
    expect(data[0]["show"]["name"]).to eq("Kirby Buckets")

    expect(data[1]["id"]).to eq(2)
    expect(data[1]["show"]["name"]).to eq("Doctor Who")

    expect(data[2]["id"]).to eq(3)
    expect(data[2]["show"]["name"]).to eq("Homeland")
  end
end
