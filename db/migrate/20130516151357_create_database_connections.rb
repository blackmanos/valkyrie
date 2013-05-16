class CreateDatabaseConnections < ActiveRecord::Migration
  def change
    create_table :database_connections do |t|
      t.string :name, default: 'Realmlist'
      t.string :host
      t.string :kind, default: 'realm'
      t.string :adapter, default: 'mysql2'
      t.string :username
      t.binary :encrypted_password
      t.string :database
    end
  end
end
