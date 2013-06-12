require 'digest/sha1'

# @attr_reader [Fixnum] id
# @attr_reader [String] username
# @attr_reader [String] sha_pass_hash
# @attr_reader [Fixnum] gmlevel
# @attr_reader [String] sessionkey
# @attr_reader [String] v
# @attr_reader [String] s
# @attr_reader [String] email
# @attr_reader [ActiveSupport::TimeWithZone] joindate
# @attr_reader [String] last_ip
# @attr_reader [Fixnum] failed_logins
# @attr_reader [Fixnum] locked
# @attr_reader [ActiveSupport::TimeWithZone] last_login
# @attr_reader [Fixnum] active_realm_id
# @attr_reader [Fixnum] mutetime
# @attr_reader [Fixnum] locale
# @attr_reader [String] reg_id
# @attr_reader [String] client_info


class Wow::Realmd::Account < ActiveRecord::Base
  extend Wow::ClassMethods

  GM_LEVELS = {
    0 => 'player',
    1 => 'moderator',
    2 => 'game_master',
    3 => 'bug_tracker',
    4 => 'admin',
    5 => 'sys_op'
  }

  LOCALES = {
    0 => 'english',
    1 => 'korean',
    2 => 'french',
    3 => 'german',
    4 => 'chinese_simplified',
    5 => 'chinese_taiwan',
    6 => 'spanish',
    7 => 'spanish_mexico',
    8 => 'russian'
  }

  self.table_name = 'account'
  
  attr_accessible :gmlevel, :password, :locale

  
  def password=(password)
    unless password.blank?
      self.sha_pass_hash = Digest::SHA1.hexdigest("#{self.username.upcase}:#{password.upcase}").upcase
      self.v = 0
      self.s = 0
    end
  end
  scope :players, where(gmlevel: 0)
  scope :moderators, where(gmlevel: 1)
  scope :game_masters, where(gmlevel: 2)
  scope :bug_trackers, where(gmlevel: 3)
  scope :admins, where(gmlevel: 4)
  scope :sys_ops, where(gmlevel: 5 )
  scope :not_logged, where(last_login: 0)
end
