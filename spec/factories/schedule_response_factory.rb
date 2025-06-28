
FactoryBot.define do
  factory :tv_maze_response, class: String do
    initialize_with do
      [
        {
          "id": 1,
          "name": "Pilot",
          "season": 1,
          "number": 1,
          "summary": "A young boy named Kirby discovers his amazing artistic abilities.",
          "runtime": 30,
          "image": {
            "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/1/2668.jpg",
            "original": "https://static.tvmaze.com/uploads/images/original_untouched/1/2668.jpg"
          },
          "url": "https://www.tvmaze.com/episodes/1/kirby-buckets-1x01-pilot",
          "rating": {
            "average": 7.2
          },
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
          "name": "The Day of the Doctor",
          "season": 50,
          "number": 1,
          "summary": "The Doctor's greatest adventure begins in this special anniversary episode.",
          "runtime": 75,
          "image": {
            "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/2/5465.jpg",
            "original": "https://static.tvmaze.com/uploads/images/original_untouched/2/5465.jpg"
          },
          "url": "https://www.tvmaze.com/episodes/2/doctor-who-50x01-the-day-of-the-doctor",
          "rating": {
            "average": 9.1
          },
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
          "name": "Game On",
          "season": 3,
          "number": 12,
          "summary": "Carrie and her team execute a dangerous operation in Berlin.",
          "runtime": 55,
          "image": {
            "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/3/7854.jpg",
            "original": "https://static.tvmaze.com/uploads/images/original_untouched/3/7854.jpg"
          },
          "url": "https://www.tvmaze.com/episodes/3/homeland-3x12-game-on",
          "rating": {
            "average": 8.5
          },
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
