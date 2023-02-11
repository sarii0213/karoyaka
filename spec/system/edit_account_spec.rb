require 'rails_helper'

RSpec.describe 'アカウント', type: :system do
  let!(:user) { create(:user) }
  before do
    login_as(user)
  end
  describe 'ユーザー情報 更新' do
    it 'ユーザー情報を更新できること' do
      visit mypage_account_path
      expect(current_path).to eq '/mypage/account'
      find('.edit-link').click
      attach_file 'アバター画像', "#{Rails.root}/spec/fixtures/dummy.png"
      fill_in 'ユーザー名', with: 'test'
      fill_in 'メールアドレス', with: 'test@example.com'
      fill_in 'パスワード', with: 'new_password'
      fill_in 'パスワード（確認）', with: 'new_password'
      fill_in '現在のパスワード', with: user.password
      click_on 'Update'
      expect(page).to have_content 'アカウント情報を変更しました'
      sleep 1
      user.reload
      expect(user.avatar.attached?).to eq true
      expect(user.username).to eq 'test'
      expect(user.email).to eq 'test@example.com'
      expect(user.valid_password?('new_password')).to eq true
    end
  end
end
