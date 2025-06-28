FactoryBot.define do
  factory :show do
    sequence(:name) { |n| "Show #{n}" }
    summary { "A great show about something" }
    language { "English" }
    status { "Running" }
    runtime { 60 }
    premiered { "2024-01-01" }
    official_site { "https://example.com" }
    schedule_time { "20:00" }
    schedule_days { ["Monday", "Wednesday"] }
    rating_average { 8.5 }
    show_type { "Scripted" }
    genres { ["Drama", "Comedy"] }
    image_original { "https://example.com/image.jpg" }
    image_medium { "https://example.com/image_medium.jpg" }
    association :network
  end
end
