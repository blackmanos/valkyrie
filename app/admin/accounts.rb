ActiveAdmin.register Wow::Realmd::Account, as: 'Account' do
  menu parent: 'World Of Warcraft'

  filter :id
  filter :username
  filter :gmlevel, as: :select, collection: Wow::Realmd::Account::GM_LEVELS.inject({}) { |h, (k, v)| h[k] = v.humanize; h }.invert
  filter :email
  filter :joindate, as: :date_range
  filter :last_ip
  filter :failed_logins
  filter :locked
  filter :last_login, as: :date_range
  filter :active_realm_id
  filter :mutetime
  filter :locale, as: :select, collection: Wow::Realmd::Account::LOCALES.inject({}) { |h, (k, v)| h[k] = v.humanize; h }.invert
  filter :reg_ip

  scope :all, default: true
  scope :players
  scope :moderators
  scope :game_masters
  scope :bug_trackers
  scope :admins
  scope :sys_ops
  scope :not_logged

  index do
    selectable_column
    id_column
    column :username
    column t('activerecord.attributes.wow.realmd.account.gmlevel'), sortable: :gmlevel do |account|
      Wow::Realmd::Account::GM_LEVELS[account.gmlevel].humanize
    end
    column :email
    column :last_ip
    column :last_login
    column :active_realm_id
    column t('activerecord.attributes.wow.realmd.account.locale'), sortable: :locale do |account|
      Wow::Realmd::Account::LOCALES[account.locale].humanize
    end
    default_actions
  end

  show do |account|
    attributes_table do
      row :username
      row :gmlevel do
        Wow::Realmd::Account::GM_LEVELS[account.gmlevel].humanize
      end
      row :email
      row :joindate
      row :last_ip do
        div do
          link_to account.last_ip, admin_accounts_path('q[last_ip_contains]' => account.last_ip)
        end
        div do
          account.address(:last_ip)
        end
      end
      row :failed_logins
      row :locked
      row :last_login
      row :active_realm_id
      row :mutetime
      row t('activerecord.attributes.wow.realmd.account.locale') do
        Wow::Realmd::Account::LOCALES[account.locale].humanize
      end
      row :reg_ip do
        div do
          link_to account.reg_ip, admin_accounts_path('q[reg_ip_contains]' => account.reg_ip)
        end
        div do
          account.address(:reg_ip)
        end
      end
      row :client_info
    end

    h1 { t(:characters) }
    DatabaseConnection.character.saved.each do |connection|
      Wow::Chars.database_connection = connection
      Wow::Chars.connect
      h2 do
        connection.name
      end
      panel t(:active_characters) do
        table_for Wow::Chars::Character.by_account(account.id).all do
          column :name
          column :level
          column :race do |character|
            Wow::Chars::Character::RACES[character.race].humanize
          end
          column :class do |character|
            Wow::Chars::Character::CLASSES[character.class_id].humanize
          end
        end
      end

      panel t(:deleted_characters) do
        table_for Wow::Chars::Character.deleted_by_account(account.id).all do
          column :name do |character|
            character.deleteInfos_Name
          end
          column :level
          column :race do |character|
            Wow::Chars::Character::RACES[character.race].humanize
          end
          column :class do |character|
            Wow::Chars::Character::CLASSES[character.class_id].humanize
          end
        end
      end
    end

    active_admin_comments
  end

  controller do
    before_filter :establish_realm_connection

    private

    def establish_realm_connection
      Wow::Realmd::Account.connect
    end
  end
  
  form do |f|
    f.inputs t('general') do
      f.input :username
      f.input :email, as: :email
      f.input :gmlevel, as: :select, collection: Wow::Realmd::Account::GM_LEVELS.inject({}) { |h, (k, v)| h[k] = v.humanize; h }.invert
      f.input :locale, as: :select, collection: Wow::Realmd::Account::LOCALES.inject({}) { |h, (k, v)| h[k] = v.humanize; h }.invert
      f.input :password
    end
    f.actions
  end  
end
