# == Schema Information
#
# Table name: categories
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
#  index_categories_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Category do
  subject { build(:category) }

  it { is_expected.to be_valid }

  describe '#selectable' do
    let!(:category_1) { create(:category, selectable: true) }
    let!(:category_2) { create(:category, selectable: false) }

    it '選択可能なもののみ取得できること' do
      expect(described_class.selectable).not_to include(category_2)
    end
  end
end
