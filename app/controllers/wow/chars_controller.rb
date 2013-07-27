class Wow::CharsController < ApplicationController
  before_filter :establish_chars_connection

  protected

  def establish_chars_connection
    if params.key? :realm
      if connection = DatabaseConnection.character.saved.find_by_name(params[:realm])
        Wow::Chars.database_connection = connection
        Wow::Chars.connect
      end
    end
  end
end