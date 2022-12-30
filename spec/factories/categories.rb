# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :category do
    name { Faker::JapaneseMedia::StudioGhibli.unique.movie }
    description { Faker::JapaneseMedia::StudioGhibli.quote }
  end
end
