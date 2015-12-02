ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "tarmac.io",
  :user_name            => "juanr@tarmac.io",
  :password             => ENV["GMAIL_PASSWORD"],
  :authentication       => :plain,
  :enable_starttls_auto => true
}
