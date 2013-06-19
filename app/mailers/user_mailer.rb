class UserMailer < ActionMailer::Base
  default :from => "admin@toomanychips.com"
  
  # def registration(user_id)
  #   @user = User.find(user_id)
  #   email_with_name = "#{@user.name} <#{@user.email}>"
    
  #   mail(:to => email_with_name, :subject => "Registered")
  # end

  # def confirmation(user_id, event_id)
  #   @user = user
    
  #   mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  # end
  def signup_confirmation(user_id)
    @user = User.find(user_id)
    email_with_name = "#{@user.name} <#{@user.email}>"

    mail(:to => email_with_name, subject: "Welcome to TooManyChips!")
  end
end