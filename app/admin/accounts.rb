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

  index do
    selectable_column
    id_column
    column :username
    column t('activerecord.attributes.wow.realmd.account.gmlevel'), sortable: :gmlevel do |account|
      Wow::Realmd::Account::GM_LEVELS[account.gmlevel].humanize
    end
    column :email
    column :last_ip
    column :active_realm_id
    column t('activerecord.attributes.wow.realmd.account.locale'), sortable: :locale do |account|
      Wow::Realmd::Account::LOCALES[account.locale].humanize
    end
    default_actions
  end

  controller do
    before_filter :establish_connection

    private

    def establish_connection
      Wow::Realmd::Account.connect
    end
  end
  
end
