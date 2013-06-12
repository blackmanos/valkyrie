class Wow::Chars::Character < ActiveRecord::Base
  extend Wow::ClassMethods

  CLASSES = {
      1 => 'warrior',
      2 => 'paladin',
      3 => 'hunter',
      4 => 'rogue',
      5 => 'priest',
      #6 => 'death_knight',
      7 => 'shaman',
      8 => 'mage',
      9 => 'warlock',
      11 => 'druid'
  }

  RACES = {
      1 => 'human',
      2 => 'orc',
      3 => 'dwarf',
      4 => 'night_elf',
      5 => 'undead',
      6 => 'tauren',
      7 => 'gnome',
      9 => 'troll'
  }

  scope :by_account, lambda{ |account| where(account: account) unless account.nil? }
  scope :deleted_by_account, lambda { |account| where(deleteInfos_Account: account) unless account.nil? }
end
