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
require 'rails_helper'

RSpec.describe LettingGoWay do
  subject { build(:letting_go_way) }

  it { is_expected.to be_valid }

  describe '#selectable' do
    let!(:letting_go_way_1) { create(:letting_go_way, selectable: true) }
    let!(:letting_go_way_2) { create(:letting_go_way, selectable: false) }

    it '選択可能なもののみ取得できること' do
      expect(described_class.selectable).not_to include(letting_go_way_2)
    end
  end

  describe '::optimal' do
    it '該当のカテゴリー・理由における最適な手放す方法が格納されること' do
      expect(described_class.optimal(1, 1)).to match([LettingGoWay.find(1), LettingGoWay.find(2), LettingGoWay.find(3)])
    end
  end

  describe '::category_optimal' do
    it '該当のカテゴリーにおける最適な手放す方法が格納されること' do
      expect(described_class.category_optimal(1)).to match([LettingGoWay.find(1), LettingGoWay.find(3), LettingGoWay.find(4)])
    end
  end

  describe '::reason_optimal' do
    it '該当の理由における最適な手放す方法が格納されること' do
      expect(described_class.reason_optimal(1)).to match([LettingGoWay.find(1), LettingGoWay.find(2), LettingGoWay.find(3)])
    end
  end
end
