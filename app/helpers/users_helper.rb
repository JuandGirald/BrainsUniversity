module UsersHelper

	def gravatar_for(user)
		  Digest::MD5::hexdigest(user.email.downcase)
  end

end
