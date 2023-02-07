# == Schema Information
#
# Table name: category_way_optimalities
#
#  id                :bigint           not null, primary key
#  score             :decimal(3, 2)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :bigint           not null
#  letting_go_way_id :bigint           not null
#
# Indexes
#
#  category_way_id_uniqueness                            (category_id,letting_go_way_id) UNIQUE
#  index_category_way_optimalities_on_category_id        (category_id)
#  index_category_way_optimalities_on_letting_go_way_id  (letting_go_way_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (letting_go_way_id => letting_go_ways.id)
#
FactoryBot.define do
  factory :category_way_optimality do
    category
    letting_go_way
    score { rand(0.0..1).round(2) }
  end
end
