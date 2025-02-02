FactoryBot.define do
  factory :spot do
    name        { FFaker::Lorem.name }
    description { FFaker::Lorem.paragraph }
    latitude    { FFaker::Geolocation.lat }
    longitude   { FFaker::Geolocation.lng }
    difficulty  { 'Intermediate' }
    best_season { 'Summer' }

    association :user
  end
end
