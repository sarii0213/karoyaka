# == Schema Information
#
# Table name: letting_go_ways
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  name        :string(255)      not null
#  selectable  :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_letting_go_ways_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :letting_go_way do
    name { Faker::JapaneseMedia::StudioGhibli.unique.movie }
    description { Faker::JapaneseMedia::StudioGhibli.quote }
  end
end
