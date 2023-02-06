require 'rails_helper'

RSpec.describe '手放したいものリスト' do
  let!(:user) { create(:user) }

  before do
    login_as(user)
  end

  describe '新規登録' do
    it '手放したいものを新規登録できること' do
      visit new_to_let_go_item_path
      attach_file 'to_let_go_item[image]', Rails.root.join('spec', 'fixtures', 'dummy.png')
      select '生活雑貨', from: 'to_let_go_item[category_id]'
      fill_in 'to_let_go_item[name]', with: 'セーター'
      select '使ってない', from: 'to_let_go_item[reason_id]'
      click_on '登録する'
      expect(page).to have_content '登録しました'
    end

    it '手放したいもののカテゴリー・理由を選択すると手放す方法のヒントが表示されること' do
      visit new_to_let_go_item_path
      select '生活雑貨', from: 'to_let_go_item[category_id]'
      select '使ってない', from: 'to_let_go_item[reason_id]'
      # 手放す方法：「ゴミ」, 「お店」, 「ゆずる」, 「回収依頼」
      # カテゴリー「生活雑貨」の最適値： 1, 0.3, 0.5, 0.4
      # 理由「使ってない」の最適値：0.7, 0.7, 0.7, 0.5
      # カテゴリー x 理由：0.7, 0.21, 0.35, 0.2
      within('#letting_go_way_hint') do
        expect(page).to have_content('ゴミ')
        expect(page).to have_content('ゆずる')
        expect(page).to have_content('お店')
      end
    end
  end


  describe '編集' do
    let!(:to_let_go_item) { create(:to_let_go_item, user:, category_id: 2) }

    it '編集ができること' do
      visit to_let_go_item_path(to_let_go_item)
      find('.edit-link').click
      fill_in 'to_let_go_item[name]', with: 'スウェット'
      click_on '更新する'
      expect(page).to have_content '更新しました'
      expect(page).to have_content 'スウェット'
    end
  end

  describe '削除' do
    let!(:to_let_go_item) { create(:to_let_go_item, user:, category_id: 2) }

    it '削除ができること' do
      visit to_let_go_item_path(to_let_go_item)
      accept_confirm { find('.delete-link').click }
      expect(page).to have_content '削除しました'
      expect(page).not_to have_content to_let_go_item.category.name
    end
  end
end
