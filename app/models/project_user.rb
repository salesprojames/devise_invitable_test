class ProjectUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	attr_accessor :email

	before_validation :set_user_id, lambda { |pu| !!pu.email }

	def set_user_id
		existing_user = User.find_by(email: email)
		self.user =	if existing_user.present?
					  	existing_user
					else
						User.invite!(email: email)			
					end
	end
end
