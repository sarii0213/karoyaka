require 'rails_helper'

RSpec.describe 'アカウント', type: :system do
  let!(:user) { create(:user) }
  before do
    login_as(user)
  end
  describe 'ユーザー情報 更新' do
    fit 'ユーザー情報を更新できること' do
      visit mypage_account_path
      expect(current_path).to eq '/mypage/account'
      find('.edit-link').click
      attach_file 'user[avatar]', "#{Rails.root}/spec/fixtures/dummy.png"
      fill_in 'user[username]', with: 'test'
      fill_in 'user[email]', with: 'test@test.com'
      fill_in 'user[password]', with: 'new_password'
      fill_in 'user[password_confirmation]', with: 'new_password'
      fill_in 'user[current_password]', with: user.password
      click_on 'Update'
      expect(page).to have_content 'アカウント情報を変更しました'
      sleep 1
      user.reload
      expect(user.avatar.attached?).to eq true
      expect(user.username).to eq 'test'
      expect(user.email).to eq 'test@test.com'
      expect(user.valid_password?('new_password')).to eq true
    end
  end
end
