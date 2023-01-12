module LoginMacros
  def login_as(user)
    visit '/login'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log in'

    expect(page).to have_content 'ログインしました'
  end
end
