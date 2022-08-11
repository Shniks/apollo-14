require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  it 'can compute total time in space for each astronaut' do
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

    expect(astronaut_1.total_time).to eq(500)
    expect(astronaut_2.total_time).to eq(900)
  end
end
