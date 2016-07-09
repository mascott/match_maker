class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable

  belongs_to :organization
  has_many :parings
  has_many :periods, through: :pairing

  delegate :name, to: :organization, prefix: true

  def name
    "#{first_name} #{last_name}"
  end

end
