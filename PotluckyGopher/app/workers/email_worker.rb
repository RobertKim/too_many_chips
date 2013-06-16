class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(user_id) #, event_id, email_type)
    # if email_type == "signup"
      UserMailer.registration(user_id).deliver
    # elsif email_type == "confirm"
    #   UserMailer.confirmation(user_id, event_id).deliver
    # end
  end
end
