require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do
  describe 'ユーザー登録機能' do
    context '入力情報に誤りがある場合' do
      it 'エラーメッセージが表示される' do
        visit '/signup'
        fill_in 'username', with: 'test'
        fill_in 'email', with:  ''
        fill_in 'password', with: 'password'
        fill_in 'password（確認用）', with: 'password'
        click_on 'Sign up'
        expect(page).to have_content 'メールアドレスを入力してください'
      end
    end

    context '入力情報が正しい場合' do
      it 'ユーザー登録ができる' do
        visit '/signup'
        fill_in 'username', with: 'test'
        fill_in 'email', with:  'test@test.com'
        fill_in 'password', with: 'password'
        fill_in 'password（確認用）', with: 'password'
        click_on 'Sign up'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
  end
end