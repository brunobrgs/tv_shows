require 'rails_helper'

RSpec.describe Api::V1::TvshowsController, type: :controller do
  describe 'GET #index' do
    let!(:show1) { create(:show) }
    let!(:show2) { create(:show) }

    let!(:episode1) do
      create(:episode,
             show: show1,
             name: 'Pilot',
             season: 1,
             number: 1,
             rating_average: 8.5,
             airstamp: "2024-01-01T19:30:00+00:00"
      )
    end

    let!(:episode2) do
      create(:episode,
             show: show2,
             name: 'First Episode',
             season: 1,
             number: 1,
             rating_average: 7.5,
             airstamp: "2024-02-01T19:30:00+00:00"
      )
    end

    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns episodes in the correct format' do
      get :index
      json_response = JSON.parse(response.body)

      expect(json_response).to include('episodes', 'meta')
      expect(json_response['episodes'].first).to eq({
                                                      "id" => episode1.id,
                                                      "images" => {
                                                        "medium" => "https://static.tvmaze.com/uploads/images/medium_landscape/1/2668.jpg",
                                                        "original" => "https://static.tvmaze.com/uploads/images/original_untouched/1/2668.jpg"
                                                      },
                                                      "name" => "Pilot",
                                                      "number" => 1,
                                                      "rating" => "8.5",
                                                      "runtime" => 45,
                                                      "season" => 1,
                                                      "show" => { "id" => show1.id, "name" => show1.name },
                                                      "summary" => "An exciting pilot episode that sets up the series storyline."
                                                    })
    end

    it 'includes pagination metadata' do
      get :index
      json_response = JSON.parse(response.body)

      expect(json_response['meta']).to include(
                                         'current_page',
                                         'total_pages',
                                         'total_count'
                                       )
    end

    context 'with date filters' do
      it 'filters episodes by date range' do
        get :index, params: {
          date_from: '2024-01-01',
          date_to: '2024-01-31'
        }

        json_response = JSON.parse(response.body)
        expect(json_response['episodes'].length).to eq(1)
        expect(json_response['episodes'].first['name']).to eq('Pilot')
      end
    end

    context 'with pagination' do
      before do
        create_list(:episode, 2, show: show1)
      end

      it 'respects the per_page parameter' do
        get :index, params: { per_page: 1 }

        json_response = JSON.parse(response.body)
        expect(json_response['episodes'].length).to eq(1)
      end

      it 'respects the page parameter' do
        get :index, params: { page: 2, per_page: 1 }

        json_response = JSON.parse(response.body)
        expect(json_response['meta']['current_page']).to eq(2)
      end
    end
  end
end
