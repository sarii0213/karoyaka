require 'rails_helper'

RSpec.describe "手放したいものリスト", type: :system do
  let!(:user) { create(:user) }
  before do
    login_as(user)
  end

  describe '新規登録' do
    it '手放したいものを新規登録できること' do
      visit new_to_let_go_list_path
      attach_file 'to_let_go_list[image]', Rails.root.join('spec', 'fixtures', 'dummy.png')
      find('#to_let_go_list_category_id').find("option[value='2']").select_option
      fill_in 'to_let_go_list[item]', with: 'セーター'
      find('#to_let_go_list_reason_id').find("option[value='2']").select_option
      click_on '登録する'
      expect(page).to have_content '登録しました'
    end
  end

  describe '編集' do
    let!(:to_let_go_list) { create(:to_let_go_list, user: user) }
    it '編集ができること' do
      visit to_let_go_list_path(to_let_go_list)
      click_on '編集する'
      fill_in 'to_let_go_list[item]', with: 'スウェット'
      click_on '更新する'
      expect(page).to have_content '更新しました'
      expect(page).to have_content 'スウェット'
    end
  end

  describe '削除' do
    let!(:to_let_go_list) { create(:to_let_go_list, user: user) }
    it '削除ができること' do
      visit to_let_go_list_path(to_let_go_list)
      accept_confirm { click_on '削除' }
      expect(page).to have_content '削除しました'
      expect(page).not_to have_content to_let_go_list.category.name
    end
  end

end
