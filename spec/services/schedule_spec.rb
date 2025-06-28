# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Schedule do
  before do
    sample_response = JSON.parse(build(:tv_maze_response))
    allow(TvMaze).to receive(:schedule_for).and_return(sample_response)
  end

  it "create countries that are not yet persisted" do
    expect { described_class.upsert! }.to change(Country, :count).by(2)
    expect { described_class.upsert! }.to change(Country, :count).by(0)
  end

  it "updates countries that are already persisted" do
    create(:country, code: 'US', name: "Wrong name")

    described_class.upsert!

    expect(Country.find_by(code: 'US').name).to eq("United States")
  end

  it "creates networks that are not yet persisted" do
    expect { described_class.upsert! }.to change(Network, :count).by(3)
    expect { described_class.upsert! }.to change(Network, :count).by(0)
  end

  it "updates networks that are already persisted" do
    create(:network, id: 1, name: "Wrong name")

    described_class.upsert!

    expect(Network.find_by(id: 1).name).to eq("Disney XD")
  end

  it "creates shows that are not yet persisted" do
    expect { described_class.upsert! }.to change(Show, :count).by(3)
    expect { described_class.upsert! }.to change(Show, :count).by(0)
  end

  it "updates shows that are already persisted" do
    create(:show, id: 1, name: "Wrong name")

    described_class.upsert!

    expect(Show.find_by(id: 1).name).to eq("Kirby Buckets")
  end

  it "creates episodes that are not yet persisted" do
    expect { described_class.upsert! }.to change(Episode, :count).by(3)
    expect { described_class.upsert! }.to change(Episode, :count).by(0)
  end

  it "updates episodes that are already persisted" do
    create(:episode, id: 1, name: "Wrong name")

    described_class.upsert!

    expect(Episode.find_by(id: 1).name).to eq("Pilot")
  end
end
