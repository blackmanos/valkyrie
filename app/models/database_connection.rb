require 'openssl'
require 'digest'

class DatabaseConnection < ActiveRecord::Base
  TYPES = %w(realm character world)
  ADAPTERS = %w(mysql2)

  attr_accessible :adapter, :database, :password, :host, :kind, :username, :name
  validates :host, :kind, :name, presence: true
  validates :adapter, inclusion: { in: ADAPTERS }
  validates :kind, inclusion: { in: TYPES }
  validate :test_connection

  after_save :create_chars_databases

  def realm?
    kind == 'realm'
  end

  def password
    if self.encrypted_password
      load_aes
      @aes.decrypt
      @aes.key = @key
      @aes.update(self.encrypted_password) + @aes.final
    else
      ''
    end
  end

  def password=(password)
    return if password.blank?
    load_aes
    @aes.encrypt
    @aes.key = @key
    self.encrypted_password = @aes.update(password) + @aes.final
  end

  def to_h
    { adapter: adapter, host: host, username: username, password: password, database: database }
  end

  scope :character, where(kind: 'character')
  scope :saved, where( "`encrypted_password` <> '' AND `database` <> '' AND `username` <> '' AND `adapter` <> ''" )

  protected

  def create_chars_databases
    return unless realm?

    Wow::Realmd::Realmlist.database_connection = self
    Wow::Realmd::Realmlist.connect

    Wow::Realmd::Realmlist.find_each do |realm|
      unless DatabaseConnection.exists? name: realm.name, kind: 'character'
        database_connection = DatabaseConnection.new name: realm.name, kind: 'character', host: realm.address
        database_connection.save
      end
    end
  end

  def load_aes
    key = Valkyrie::Application.config.secret_token
    @key ||= Digest::MD5.digest(key) if(key.kind_of?(String) && 16 != key.bytesize)
    @aes ||= OpenSSL::Cipher.new('AES-128-CBC')
  end

  def test_connection
    unless self.password.blank? || self.database.blank? || self.username.blank? || self.adapter.blank?
      case adapter
        when 'mysql2'
          begin
            Mysql2::Client.new(host: host, username: username, password: password, database: database)
          rescue Mysql2::Error => e
            errors.add(:host, e.message)
          end
      end
    end
  end
end
