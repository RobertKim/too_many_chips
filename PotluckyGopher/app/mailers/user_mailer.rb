class UserMailer < ActionMailer::Base
  default :from => "movesf.dbc@gmail.com"
  
  # def registration(user_id)
  #   @user = User.find(user_id)
  #   email_with_name = "#{@user.name} <#{@user.email}>"
    
  #   mail(:to => email_with_name, :subject => "Registered")
  # end

  # def confirmation(user_id, event_id)
  #   @user = user
    
  #   mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  # end
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "GopherPotLuck! sign up confirmation."
  end


end