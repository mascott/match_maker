class Season < ActiveRecord::Base
  belongs_to :user
  has_many :periods
end
