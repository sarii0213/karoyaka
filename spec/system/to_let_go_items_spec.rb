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
      find_by_id('to_let_go_item_category_id').find("option[value='2']").select_option
      fill_in 'to_let_go_item[name]', with: 'セーター'
      find_by_id('to_let_go_item_reason_id').find("option[value='2']").select_option
      click_on '登録する'
      expect(page).to have_content '登録しました'
    end
  end

  describe '編集' do
    let!(:to_let_go_item) { create(:to_let_go_item, user:, category_id: 2) }

    it '編集ができること' do
      visit to_let_go_item_path(to_let_go_item)
      click_on '編集する'
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
      accept_confirm { click_on '削除' }
      expect(page).to have_content '削除しました'
      expect(page).not_to have_content to_let_go_item.category.name
    end
  end
end
