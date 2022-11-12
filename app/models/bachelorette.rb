class Bachelorette <ApplicationRecord
  has_many :contestants
  
  validates_presence_of :name, :season_number
end
