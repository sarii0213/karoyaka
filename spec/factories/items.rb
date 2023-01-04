# == Schema Information
#
# Table name: items
#
#  id                :bigint           not null, primary key
#  name              :string(255)
#  type              :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :bigint           not null
#  letting_go_way_id :bigint
#  reason_id         :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_items_on_category_id        (category_id)
#  index_items_on_letting_go_way_id  (letting_go_way_id)
#  index_items_on_reason_id          (reason_id)
#  index_items_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (letting_go_way_id => letting_go_ways.id)
#  fk_rails_...  (reason_id => reasons.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :item do
    category
    name { [Faker::Lorem.word, nil].sample }
    reason
    user
    type { %w[ToLetGoItem DoneLettingGoItem].sample }

    trait :to_let_go_item do
      letting_go_way { nil }
      type { 'ToLetGoItem' }
    end

    trait :done_letting_go_item do
      letting_go_way
      type { 'DoneLettingGoItem' }
    end
  end
end
