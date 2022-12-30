# == Schema Information
#
# Table name: reasons
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_reasons_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :reason do
    name { Faker::JapaneseMedia::StudioGhibli.unique.movie }
    description { Faker::JapaneseMedia::StudioGhibli.quote }
  end
end
