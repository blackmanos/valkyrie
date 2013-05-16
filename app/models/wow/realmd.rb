module Wow::Realmd
  module ClassMethods
    def connect
      establish_connection database_config('Realmlist')
    end

    def database_connection=(database_connection)
      @database_connection = database_connection
    end

    protected

    def database_config(name)
      @database_connection ||= DatabaseConnection.find_by_name(name)
      @database_connection.to_h
    end
  end
end
