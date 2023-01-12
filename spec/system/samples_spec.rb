require 'rails_helper'

RSpec.describe('Samples') do
  describe 'Capybaraの疎通確認' do
    xit 'ページが開ける' do
      visit '/'
      expect(page).to have_content 'Capybara疎通テスト'
    end
  end
end
