require 'rails_helper'

RSpec.describe 'When I visit astronauts index page' do
  it 'I can see total time in space for each astronaut' do

    astronaut_1 = Astronaut.create!(name: 'Neil Armstrong', age: 44, job: 'Spacewalker')
    astronaut_2 = Astronaut.create!(name: 'Edwin Aldrin', age: 40, job: 'Pilot')

    mission_1 = Mission.create!(title: 'Apollo 13', time_in_space: 400)
    mission_2 = Mission.create!(title: 'Gemini 7', time_in_space: 200)
    mission_3 = Mission.create!(title: 'Capricon 4', time_in_space: 300)

    astronaut_1.missions << mission_2
    astronaut_1.missions << mission_3
    astronaut_2.missions << mission_3
    astronaut_2.missions << mission_2
    astronaut_2.missions << mission_1

    visit '/astronauts'

    within '.astronaut_1' do
      expect(page).to have_content('Total Time in Space: 500 days')
    end

    within '.astronaut_2' do
      expect(page).to have_content('Total Time in Space: 900 days')
    end
  end
end
