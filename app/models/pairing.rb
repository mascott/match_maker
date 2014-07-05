class Pairing < ActiveRecord::Base
  belongs_to :period
  belongs_to :hosting_user, class_name: "User"
  belongs_to :visiting_user, class_name: "User"
end
