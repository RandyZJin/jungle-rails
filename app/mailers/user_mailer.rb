class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(recipient)
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    @user = recipient
    @url  = 'http://example.com/login'
    puts "welcome!"
    # mail(to: @user.email,
    # subject: 'Welcome to My Awesome Site',
    # content_type: "text/html",
    # body: "<html><strong>Hello there</strong></html>"
    # )
    mail(to: 'mail4000@mailinator.com',
    subject: 'Welcome to My Awesome Site',
    content_type: "text/html",
    body: "<html><strong>Hello there</strong></html>"
    )
  end
end
