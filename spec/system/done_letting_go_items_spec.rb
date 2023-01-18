require 'rails_helper'

RSpec.describe '手放し済みリスト' do
  let!(:user) { create(:user) }

  before do
    login_as(user)
  end

  describe '新規登録' do
    it '手放したものを新規登録できること' do
      visit new_done_letting_go_item_path
      attach_file 'done_letting_go_item[image]', Rails.root.join('spec', 'fixtures', 'dummy.png')
      find_by_id('done_letting_go_item_category_id').find("option[value='2']").select_option
      fill_in 'done_letting_go_item[name]', with: 'セーター'
      find_by_id('done_letting_go_item_reason_id').find("option[value='2']").select_option
      find_by_id('done_letting_go_item_letting_go_way_id').find("option[value='2']").select_option
      click_on '登録する'
      expect(page).to have_content '登録しました'
    end
  end

  describe '編集' do
    let!(:done_letting_go_item) { create(:done_letting_go_item, user:) }

    it '編集ができること' do
      visit done_letting_go_item_path(done_letting_go_item)
      click_on '編集する'
      fill_in 'done_letting_go_item[name]', with: 'スウェット'
      click_on '更新する'
      expect(page).to have_content '更新しました'
      expect(page).to have_content 'スウェット'
    end
  end

  describe '削除' do
    let!(:done_letting_go_item) { create(:done_letting_go_item, user:) }

    it '削除ができること' do
      visit done_letting_go_item_path(done_letting_go_item)
      accept_confirm { click_on '削除' }
      expect(page).to have_content '削除しました'
      expect(page).not_to have_content done_letting_go_item.category.name
    end
  end
end
