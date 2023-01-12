# == Schema Information
#
# Table name: quotes
#
#  id          :bigint           not null, primary key
#  author      :string(255)      default("不明"), not null
#  content     :string(255)      not null
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_quotes_on_content  (content) UNIQUE
#
FactoryBot.define do
  factory :quote do
    author { Faker::Lorem.word }
    content { Faker::Lorem.word }
    description { [Faker::Lorem.paragraph, nil].sample }
  end
end
