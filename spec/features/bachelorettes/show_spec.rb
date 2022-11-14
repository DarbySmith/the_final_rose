require 'rails_helper'

RSpec.describe 'bachelorette show page' do
  before(:each) do
    @bach = Bachelorette.create!(name: "Hannah Brown", season_number: 11, description: "Most dramatic season yet")

    @contestant_1 = @bach.contestants.create!(name: "Peter Weber", age: 31, hometown: "Los Angeles, CA")
    @contestant_2 = @bach.contestants.create!(name: "Tyler Cameron", age: 29, hometown: "Jupiter, FL")
  end

  it 'shows the name, season number and description for the bachelorette' do
    visit bachelorette_path(@bach)

    expect(page).to have_content(@bach.name)
    expect(page).to have_content(@bach.season_number)
    expect(page).to have_content(@bach.description)
  end

  it 'has the average age of contestants' do
    visit bachelorette_path(@bach)

    expect(page).to have_content("Average Age of Contestants: 30")
  end
end
