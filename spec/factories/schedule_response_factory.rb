
FactoryBot.define do
  factory :tv_maze_response, class: String do
    initialize_with do
      [
        {
          "id": 1,
          "show": {
            "id": 1,
            "name": "Kirby Buckets",
            "network": {
              "id": 1,
              "name": "Disney XD",
              "country": {
                "name": "United States",
                "code": "US",
                "timezone": "America/New_York"
              }
            }
          }
        },
        {
          "id": 2,
          "show": {
            "id": 2,
            "name": "Doctor Who",
            "network": {
              "id": 2,
              "name": "BBC One",
              "country": {
                "name": "United Kingdom",
                "code": "GB",
                "timezone": "Europe/London"
              }
            }
          }
        },
        {
          "id": 3,
          "show": {
            "id": 3,
            "name": "Homeland",
            "network": {
              "id": 3,
              "name": "Showtime",
              "country": {
                "name": "United States",
                "code": "US",
                "timezone": "America/New_York"
              }
            }
          }
        }
      ].to_json
    end
  end
end
