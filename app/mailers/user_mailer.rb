class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  default from:'yourmail@domain.com'
  def send_welcome(user)
    mail(to: user.email, subject: “Welcome”)
  end
end
