require 'rails_helper'

RSpec.describe '手放し済みリスト' do
  let!(:user) { create(:user) }

  before do
    login_as(user)
  end

  describe '新規登録' do
    context '手放したアイテムをゼロから登録する場合' do
      it '手放し済みアイテムを新規登録できること' do
        visit new_done_letting_go_item_path
        attach_file 'アップロード', Rails.root.join('spec', 'fixtures', 'dummy.png'), make_visible: true
        select '生活雑貨', from: 'カテゴリー'
        fill_in '手放すもの', with: 'セーター'
        select '手に取ってない', from: '理由'
        select 'ゴミに出す', from: '手放す方法'
        click_on '登録する'
        expect(page).to have_content '登録しました'
      end
    end

    context '手放したいアイテムから手放すものを選ぶ場合' do
      let!(:to_let_go_item) { create(:to_let_go_item, user: user, category_id: 2, reason_id: 1) }

      it '手放し済みアイテム登録後に引き継ぎ元の手放したいアイテムは削除されること' do
        visit to_let_go_item_path(to_let_go_item)
        click_on '手放す！'
        select 'ゴミに出す', from: '手放す方法'
        click_on '登録する'
        expect(page).to have_content '登録しました'
        expect{ ToLetGoItem.find(to_let_go_item.id) }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '編集' do
    let!(:done_letting_go_item) { create(:done_letting_go_item, user:, category_id: 2, reason_id: 1) }

    it '編集ができること' do
      visit done_letting_go_item_path(done_letting_go_item)
      find('.edit-link').click
      fill_in '手放すもの', with: 'スウェット'
      click_on '更新する'
      expect(page).to have_content '更新しました'
      expect(page).to have_content 'スウェット'
    end
  end

  describe '削除' do
    let!(:done_letting_go_item) { create(:done_letting_go_item, user:, category_id: 2, reason_id: 1) }

    it '削除ができること' do
      visit done_letting_go_item_path(done_letting_go_item)
      accept_confirm { find('.delete-link').click }
      expect(page).to have_content '削除しました'
      expect(page).not_to have_content done_letting_go_item.category.name
    end
  end
end
