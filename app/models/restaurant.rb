class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  has_many :staffs
  has_many :users, through: :staffs
  has_many :offers
end
