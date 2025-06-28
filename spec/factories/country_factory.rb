FactoryBot.define do
  factory :country do
    sequence(:name) { |n| "Country #{n}" }
    sequence(:code, 'AA')
    timezone { 'UTC' }
  end
end
