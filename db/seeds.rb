connection = ActiveRecord::Base.connection
connection.tables.each do |table|
  connection.execute("TRUNCATE #{table}") unless table == 'schema_migrations'
end

def seed_table(connection, table)
  puts "Seeds #{table} table"

  sql = File.read "db/data/#{table}.sql"
  statements = sql.split /;$/
  statements.pop

  ActiveRecord::Base.transaction do
    statements.each do |statement|
      connection.execute statement
    end
  end

  puts 'Done!'
end

seed_table connection, 'wow_spells'
seed_table connection, 'wow_spell_icons'
