require 'rails_helper'

RSpec.describe 'bachelorette contestants index page' do
  before(:each) do
    @bach_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 11, description: "Most dramatic season yet")
    @bach_2 = Bachelorette.create!(name: "Clare Crawley", season_number: 13, description: "Truly the most dramatic season yet")

    @contestant_1 = @bach_1.contestants.create!(name: "Peter Weber", age: 31, hometown: "Los Angeles, CA")
    @contestant_2 = @bach_1.contestants.create!(name: "Tyler Cameron", age: 29, hometown: "Jupiter, FL")
    @contestant_3 = @bach_2.contestants.create!(name: "Dale Moss", age: 31, hometown: "New York, NY")
  end

  it 'shows contestants for a bachelorette' do
    visit bachelorette_contestants_path(@bach_1)

    within("#contestant-#{@contestant_1.id}") do
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_1.age)
      expect(page).to have_content(@contestant_1.hometown)

      expect(page).to_not have_content(@contestant_3.name)
      expect(page).to_not have_content(@contestant_3.hometown)
    end

    within("#contestant-#{@contestant_2.id}") do
      expect(page).to have_content(@contestant_2.name)
      expect(page).to have_content(@contestant_2.age)
      expect(page).to have_content(@contestant_2.hometown)

      expect(page).to_not have_content(@contestant_3.name)
      expect(page).to_not have_content(@contestant_3.age)
      expect(page).to_not have_content(@contestant_3.hometown)
    end
  end
end