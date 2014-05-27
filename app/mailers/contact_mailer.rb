class ContactMailer < ActionMailer::Base
  default :from => "noreply@solvingbooks.com", to: "admin@solvingbooks.com"

  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
end
