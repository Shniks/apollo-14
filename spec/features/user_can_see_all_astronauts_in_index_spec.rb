require 'rails_helper'

RSpec.describe 'When I visit astronauts index page' do
  it 'I can see details of each astronaut' do

    astronaut_1 = Astronaut.create!(name: 'Neil Armstrong', age: 44, job: 'Spacewalker')
    astronaut_2 = Astronaut.create!(name: 'Edwin Aldrin', age: 40, job: 'Pilot')

    visit '/astronauts'

    within '.astronaut_1' do
      expect(page). to have_content(astronaut_1.name)
      expect(page). to have_content(astronaut_1.age)
      expect(page). to have_content(astronaut_1.job)
    end

    within '.astronaut_2' do
      expect(page). to have_content(astronaut_2.name)
      expect(page). to have_content(astronaut_2.age)
      expect(page). to have_content(astronaut_2.job)
    end
  end
end
