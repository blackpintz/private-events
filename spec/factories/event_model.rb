FactoryBot.define do
    factory :event do
        description {Faker::Lorem.sentence}
        creator_id { 1 }
    end
end