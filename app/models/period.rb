class Period < ActiveRecord::Base

  has_many :pairings
  has_many :users, through: :pairing
  belongs_to :season
end
