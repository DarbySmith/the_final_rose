require 'rails_helper'

RSpec.describe 'bachelorette show page' do
  before(:each) do
    @bach = Bachelorette.create!(name: "Hannah Brown", season_number: 11, description: "Most dramatic season yet")
  end

  it 'shows the name, season number and description for the bachelorette' do
    visit bachelorette_path(@bach)

    expect(page).to have_content(@bach.name)
    expect(page).to have_content(@bach.season_number)
    expect(page).to have_content(@bach.description)
  end
end
