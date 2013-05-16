class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable,
         :lockable, :timeoutable
  #devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  scope :admin, with_role(:admin)
  scope :registered, where('`id` NOT IN (SELECT DISTINCT `user_id` FROM `users_roles`)')
end
