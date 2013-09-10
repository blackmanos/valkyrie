class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  #devise :omniauthable, :omniauth_providers => [:facebook]

  scope :admin, -> { with_role(:admin) }
  scope :registered, -> { where('`id` NOT IN (SELECT DISTINCT `user_id` FROM `users_roles`)') }

  protected

  def with_role(role)
    joins('INNER JOIN `users_roles` ON `users`.`id` = `users_roles`.`user_id`
        INNER JOIN `roles` ON `roles`.`id` = `users_roles`.`role_id`').where('`roles`.`name` = ?', role)
  end
end
