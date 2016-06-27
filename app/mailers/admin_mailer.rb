class AdminMailer < ApplicationMailer
	default to: "altoonayouth@gmail.com"

	def new_user(user)
		@user = user
		mail(subject: "New User: #{user.email}")
	end
end
