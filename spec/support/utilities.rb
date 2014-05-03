def full_title(page_title)
  base_title = "SolvingBooks"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Tu Correo",    with: user.email.upcase
    fill_in "Tu Contraseña", with: user.password
    click_button "Sign in"
  end
end