class Bachelorette <ApplicationRecord
  has_many :contestants
  has_many :contestant_outings, through: :contestants
  has_many :outings, through: :contestant_outings
  
  validates_presence_of :name, :season_number
end
