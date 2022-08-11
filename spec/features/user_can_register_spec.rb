require 'rails_helper'

RSpec.describe 'When I hit the root path, I see a Register as a User link' do
  describe 'When I click on that link and fill in details' do
    it 'I get registered as a new user and am signed in' do

      visit '/'

      click_on 'Register as a User'

      expect(current_path).to eq('/users/new')

      username = 'Mary Poppins'
      password = 'password12345'

      fill_in :username, with: username
      fill_in :password, with: password

      click_on 'Create User'

      expect(page).to have_content("Welcome, #{username}!")

      visit '/profile'

      expect(page).to have_content("Hi, #{username}! This is your profile page.")
    end
  end
end
