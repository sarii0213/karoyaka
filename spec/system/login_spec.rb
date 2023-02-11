require 'rails_helper'

RSpec.describe 'ログイン' do
  let(:user) { create(:user) }

  describe 'ログイン機能' do
    context '入力情報に誤りがある場合' do
      it 'エラーメッセージが表示される' do
        visit '/login'
        fill_in 'メールアドレス', with: 'wrong@example.com'
        fill_in 'パスワード', with: 'wrong_password'
        click_on 'Log in'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います'
      end
    end

    context '入力情報が正しい場合' do
      it 'ログインができる' do
        visit '/login'
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_on 'Log in'
        expect(page).to have_content 'ログインしました'
      end
    end
  end

  describe 'ログアウト機能' do
    before { login_as(user) }

    it 'ログアウトができる' do
      Capybara.raise_server_errors = false
      accept_confirm { click_on 'ログアウト' }
      expect(page).to have_content 'ログアウトしました'
    end
  end
end
