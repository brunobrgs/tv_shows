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

  it "creates networks that are not yet persisted" do
    expect { described_class.upsert! }.to change(Network, :count).by(3)
    expect { described_class.upsert! }.to change(Network, :count).by(0)
  end

  it "creates shows that are not yet persisted" do
    expect { described_class.upsert! }.to change(Show, :count).by(3)
    expect { described_class.upsert! }.to change(Show, :count).by(0)
  end
end
