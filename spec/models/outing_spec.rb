require 'rails_helper'

RSpec.describe Outing do
  describe 'relationships' do
    it { should have_many :contestant_outings}
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :location}
    it { should validate_presence_of :date}
  end

  before(:each) do
    @bach_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 11, description: "Most dramatic season yet")
    @bach_2 = Bachelorette.create!(name: "Clare Crawley", season_number: 13, description: "Truly the most dramatic season yet")

    @contestant_1 = @bach_1.contestants.create!(name: "Peter Weber", age: 31, hometown: "Los Angeles, CA")
    @contestant_2 = @bach_1.contestants.create!(name: "Tyler Cameron", age: 29, hometown: "Jupiter, FL")
    @contestant_3 = @bach_2.contestants.create!(name: "Dale Moss", age: 31, hometown: "New York, NY")

    @outing_1 = Outing.create!(name: "Helicopter Ride", location: "Beach", date: Time.parse('19.12.14'))
    @outing_2 = Outing.create!(name: "Waterfall Swim", location: "Fiji", date: Time.parse('19.12.19'))
    @outing_3 = Outing.create!(name: "Beach Picnic", location: "Bahamas", date: Time.parse('19.11.17'))
    @outing_4 = Outing.create!(name: "Historic Tour", location: "Ireland", date: Time.parse('21.06.23'))

    ContestantOuting.create!(outing: @outing_1, contestant: @contestant_1)
    ContestantOuting.create!(outing: @outing_3, contestant: @contestant_1)

    ContestantOuting.create!(outing: @outing_1, contestant: @contestant_2)
    ContestantOuting.create!(outing: @outing_2, contestant: @contestant_2)
    ContestantOuting.create!(outing: @outing_3, contestant: @contestant_2)

    ContestantOuting.create!(outing: @outing_4, contestant: @contestant_3)
  end

  describe 'instance methods' do
    describe '#count_contestants' do
      it 'counts the contestants for an outing' do
        expect(@outing_1.count_contestants).to eq(2)
      end
    end
  end
end