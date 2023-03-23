# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  username               :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User do
  subject { build(:user) }

  it { is_expected.to be_valid }

  describe '#favorite' do
    let!(:user) { create(:user) }
    let!(:quote) { create(:quote) }
    it 'お気に入りに登録できること' do
      expect { user.favorite(quote) }.to change { Favorite.count }.by(1)
    end
  end

  describe '#unfavorite' do
    let!(:user) { create(:user) }
    let!(:quote) { create(:quote) }
    before do
      user.favorite(quote)
    end
    it 'お気に入りを解除できること' do
      expect { user.unfavorite(quote) }.to change { Favorite.count }.by(-1)
    end
  end

  describe '#favorite?' do
    let!(:user) { create(:user) }
    let!(:quote_1) { create(:quote) }
    let!(:quote_2) { create(:quote) }
    before do
      user.favorite(quote_1)
    end
    it 'お気に入りかどうかを判定できること' do
      expect(user.favorite?(quote_1)).to be true
      expect(user.favorite?(quote_2)).to be false
    end
  end

  describe '#category_ranking' do
    let!(:user) { create(:user) }
    before do
      create_list(:done_letting_go_item, 3, user: user, category_id: 1)
      create_list(:done_letting_go_item, 2, user: user, category_id: 2)
      create_list(:done_letting_go_item, 1, user: user, category_id: 3)
    end
    it '手放し済みアイテムのカテゴリー別ランキングを取得できること' do
      expect(user.category_ranking).to eq({Category.find(1).name => 3, Category.find(2).name => 2, Category.find(3).name => 1})
    end
  end

  describe '#reason_ranking' do
    let!(:user) { create(:user) }
    before do
      create_list(:done_letting_go_item, 3, user: user, reason_id: 1)
      create_list(:done_letting_go_item, 2, user: user, reason_id: 2)
      create_list(:done_letting_go_item, 1, user: user, reason_id: 3)
    end
    it '手放し済みアイテムの理由別ランキングを取得できること' do
      expect(user.reason_ranking).to eq({Reason.find(1).name => 3, Reason.find(2).name => 2, Reason.find(3).name => 1})
    end
  end

  describe '#way_ranking' do
    let!(:user) { create(:user) }
    before do
      create_list(:done_letting_go_item, 3, user: user, letting_go_way_id: 1)
      create_list(:done_letting_go_item, 2, user: user, letting_go_way_id: 2)
      create_list(:done_letting_go_item, 1, user: user, letting_go_way_id: 3)
    end
    it '手放し済みアイテムの手放す方法別ランキングを取得できること' do
      expect(user.way_ranking).to eq({LettingGoWay.find(1).name => 3, LettingGoWay.find(2).name => 2, LettingGoWay.find(3).name => 1})
    end
  end
end
