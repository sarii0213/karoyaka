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

RSpec.describe LettingGoWay, type: :model do
  subject { build(:letting_go_way) }
  it { is_expected.to be_valid }

  describe '#selectable' do
    let!(:letting_go_way_1) { create(:letting_go_way, selectable: true) }
    let!(:letting_go_way_2) { create(:letting_go_way, selectable: false) }
    it '選択可能なもののみ取得できること' do
      expect(LettingGoWay.selectable).not_to include(letting_go_way_2)
    end
  end
end
