require 'rails_helper'

RSpec.describe 'When I visit astronauts index page' do
  it 'I can see average age of all astronauts' do

    astronaut_1 = Astronaut.create!(name: 'Neil Armstrong', age: 44, job: 'Spacewalker')
    astronaut_2 = Astronaut.create!(name: 'Edwin Aldrin', age: 40, job: 'Pilot')

    visit '/astronauts'

    expect(page).to have_content('Average Age: 42')
  end
end
