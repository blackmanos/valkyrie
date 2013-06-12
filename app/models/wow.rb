module Wow
  module ClassMethods
    def connect(name = 'Realmlist')
      establish_connection database_config(name)
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