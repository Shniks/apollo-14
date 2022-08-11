require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  it 'can sort missions alphabetically' do
    mission_1 = Mission.create!(title: 'Apollo 13', time_in_space: 400)
    mission_2 = Mission.create!(title: 'Gemini 7', time_in_space: 400)
    mission_3 = Mission.create!(title: 'Capricon 4', time_in_space: 400)

    sorted = Mission.alphabetical

    expect(sorted.first.title).to eq(mission_1.title)
    expect(sorted[1].title).to eq(mission_3.title)
    expect(sorted.last.title).to eq(mission_2.title)
  end
end
