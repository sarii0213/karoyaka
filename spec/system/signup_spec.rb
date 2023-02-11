require 'rails_helper'

RSpec.describe 'ユーザー登録' do
  describe 'ユーザー登録機能' do
    context '入力情報に誤りがある場合' do
      it 'エラーメッセージが表示される' do
        visit '/signup'
        fill_in 'ユーザー名', with: 'test'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_on 'Sign up'
        expect(page).to have_content 'メールアドレスを入力してください'
      end
    end

    context '入力情報が正しい場合' do
      it 'ユーザー登録ができる' do
        visit '/signup'
        fill_in 'ユーザー名', with: 'test'
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_on 'Sign up'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
  end
end
