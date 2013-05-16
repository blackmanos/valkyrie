ActiveAdmin.register User do
  filter :email
  filter :current_sign_in_at
  filter :last_sign_in_ip

  scope :all, default: true
  scope :admin
  scope :registered

  index do
    selectable_column
    id_column
    column :email

    column t('activerecord.models.role') do |user|
      (user.roles.without_resource.all.map{ |r| r.name }).join(' ')
    end

    column :last_sign_in_ip
    default_actions
  end

  form do |f|
    f.inputs t('general') do
      f.input :email
    end

    f.inputs t('activerecord.models.role').pluralize do
      f.input :roles, as: :check_boxes, collection: Role.accessible_by(AdminAbility.new(current_user)).without_resource.all
    end

    f.inputs t('activerecord.attributes.user.password') do
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      super
    end
  end
end
