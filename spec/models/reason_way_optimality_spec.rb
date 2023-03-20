# == Schema Information
#
# Table name: reason_way_optimalities
#
#  id                :bigint           not null, primary key
#  score             :decimal(3, 2)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  letting_go_way_id :bigint           not null
#  reason_id         :bigint           not null
#
# Indexes
#
#  index_reason_way_optimalities_on_letting_go_way_id  (letting_go_way_id)
#  index_reason_way_optimalities_on_reason_id          (reason_id)
#  reason_way_id_uniqueness                            (reason_id,letting_go_way_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (letting_go_way_id => letting_go_ways.id)
#  fk_rails_...  (reason_id => reasons.id)
#
require 'rails_helper'

RSpec.describe ReasonWayOptimality, type: :model do
  subject { build(:reason_way_optimality) }
  it { is_expected.to be_valid }

  describe '::scores' do
    it '該当の理由の手放す方法のスコアが格納されること' do
      expect(described_class.scores(1)).to eq([0.7, 0.7, 0.7, 0.5])
    end
  end
end
