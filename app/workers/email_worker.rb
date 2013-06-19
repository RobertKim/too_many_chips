class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(user_id) #, event_id, email_type)
    puts "*" * 100
    puts user_id    
   #if email_type == "signup"
    UserMailer.signup_confirmation(user_id).deliver

    # elsif email_type == "confirm"
    #   UserMailer.confirmation(user_id, event_id).deliver
    # end
  end
end
