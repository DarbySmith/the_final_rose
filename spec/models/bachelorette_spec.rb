require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
    it {should have_many(:contestant_outings).through(:contestants)}
    it { should have_many(:outings).through(:contestant_outings)}
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :season_number}
  end

  before(:each) do
    @bach = Bachelorette.create!(name: "Hannah Brown", season_number: 11, description: "Most dramatic season yet")

    @contestant_1 = @bach.contestants.create!(name: "Peter Weber", age: 31, hometown: "Los Angeles, CA")
    @contestant_2 = @bach.contestants.create!(name: "Tyler Cameron", age: 29, hometown: "Jupiter, FL")
  end

  describe 'instance methods' do
    describe '#average_age_contestants' do
      it 'returns the average age of contestants on season' do
        expect(@bach.average_age_contestants).to eq(30)
      end
    end
  end
end
