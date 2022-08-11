require 'rails_helper'

RSpec.describe 'When I visit the root path, I see a link to login' do
  describe 'When I click link and fill in incorrect log in details' do
    it 'I need to re-enter log in details' do
      user = User.create(username: "funbucket13", password: "test")

      visit '/'

      click_on 'I already have an account'

      expect(current_path).to eq('/login')

      password = 'bidrynumnum'

      fill_in :username, with: user.username
      fill_in :password, with: password

      click_on 'Log In'

      expect(current_path).to eq('/login')
      expect(page).to have_content("Sorry, you have entered the incorrect password. Try again!")
    end
  end
end
