require 'rails_helper'

RSpec.describe 'When I visit the root path, I see a link to login' do
  describe 'When I click link and fill in log in details' do
    it 'I get logged into the app' do
      user = User.create(username: "funbucket13", password: "test")

      visit '/'

      click_on 'I already have an account'

      expect(current_path).to eq('/login')

      fill_in :username, with: user.username
      fill_in :password, with: user.password

      click_on 'Log In'

      expect(current_path).to eq('/')
      expect(page).to have_content("Welcome, #{user.username}!")
      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Register as a User")
      expect(page).to_not have_content("I already have an account")
    end
  end
end
