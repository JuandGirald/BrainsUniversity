class DoubtsMailer < ActionMailer::Base
  default :from => "noreply@brainsuniversity.com", to: "info@brainsuniversity.com"

  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
end
