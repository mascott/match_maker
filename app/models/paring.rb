class Paring < ActiveRecord::Base

  belongs_to :period
  has_many :users
end
