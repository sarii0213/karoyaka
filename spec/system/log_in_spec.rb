require 'rails_helper'

RSpec.describe 'ログイン', type: :system do
  describe 'ログイン機能' do
    let(:user) { create(:user) }
    context '入力情報に誤りがある場合' do
      it 'エラーメッセージが表示される' do
        visit '/login'
        fill_in 'email', with:  'wrong@example.com'
        fill_in 'password', with: 'wrong_password'
        click_on 'Log in'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います'
      end
    end

    context '入力情報が正しい場合' do
      it 'ログインができる' do
        visit '/login'
        fill_in 'email', with:  user.email
        fill_in 'password', with: user.password
        click_on 'Log in'
        expect(page).to have_content 'ログインしました'
      end
    end
  end
end