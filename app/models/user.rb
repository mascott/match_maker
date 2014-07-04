class User < ActiveRecord::Base

  has_many :parings
  has_many :periods, through: :pairing

  def name
    "#{first_name} #{last_name}"
  end

end
