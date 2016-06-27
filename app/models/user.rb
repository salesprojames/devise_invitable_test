class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :project_users
  has_many :projects, through: :project_users

  after_create :send_notification

  def send_notification
  	AdminMailer.new_user(self).deliver
  end
end
