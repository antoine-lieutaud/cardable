class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants
  has_many :staffs

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
