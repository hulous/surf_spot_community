FactoryBot.define do
  factory :spot do
    name        { FFaker::Lorem.name }
    description { FFaker::Lorem.paragraph }
    latitude    { FFaker::Geolocation.lat }
    longitude   { FFaker::Geolocation.lng }
    difficulty  { %i[beginner intermediate pro].sample }
    best_season { %i[spring summer autumn winter].sample }

    # association :user
  end
end
