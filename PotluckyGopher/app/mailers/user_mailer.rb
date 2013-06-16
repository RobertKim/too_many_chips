class UserMailer < ActionMailer::Base
  default :from => "ryan@railscasts.com"
  
  def registration(user_id)
    @user = user
    
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def confirmation(user_id, event_id)
    @user = user
    
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end
end