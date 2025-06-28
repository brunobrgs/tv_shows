FactoryBot.define do
  factory :episode do
    name { "Pilot Episode" }
    season { 1 }
    number { 1 }
    summary { "An exciting pilot episode that sets up the series storyline." }
    runtime { 45 }
    image_original { "https://static.tvmaze.com/uploads/images/original_untouched/1/2668.jpg" }
    image_medium { "https://static.tvmaze.com/uploads/images/medium_landscape/1/2668.jpg" }
    url { "https://www.tvmaze.com/episodes/1/show-name-1x01-pilot" }
    rating_average { 8.5 }

    association :show
  end
end
