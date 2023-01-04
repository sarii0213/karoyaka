FactoryBot.define do
  factory :to_let_go_item do
    type { 'ToLetGoItem' }
    category
    name { [Faker::Lorem.word, nil].sample }
    reason
    user
    letting_go_way { nil }
  end
end
