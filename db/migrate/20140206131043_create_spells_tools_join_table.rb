class CreateSpellsToolsJoinTable < ActiveRecord::Migration
  def up
    create_join_table :spells, :items, table_name: :wow_spells_tools

    (1..2).each_with_index do |i|
      execute("INSERT INTO wow_spells_tools SELECT id, tool_#{i} FROM wow_spells WHERE tool_#{i} > 0")
    end

    change_table :wow_spells do |t|
      t.remove :tool_1
      t.remove :tool_2
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't populate spell tools"
  end
end
