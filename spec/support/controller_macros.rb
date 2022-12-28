# todo: LoginMacrosをControllerMacrosにすげ替える
# Devise GitHubのWikiにあるRSpecの書き方
# https://github.com/heartcombo/devise/wiki/How-To:-Test-controllers-with-Rails-(and-RSpec)
#【Rails】「devise」のテストコードの書き方や用意すると良いテストケース
# http://www.code-magagine.com/?p=13108
module ControllerMacros
  def login_user(user = create(:user))
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end
  end
end
