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
require 'rails_helper'

RSpec.describe CategoryWayOptimality, type: :model do
  subject { build(:category_way_optimality) }
  it { is_expected.to be_valid }

  describe '::scores' do
    it '該当のカテゴリーの手放す方法のスコアが格納されること' do
      expect(described_class.scores(1)).to eq([1, 0.3, 0.5, 0.4])
    end
  end
end
