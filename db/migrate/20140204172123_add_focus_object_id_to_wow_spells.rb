class AddFocusObjectIdToWowSpells < ActiveRecord::Migration
  def change
    add_column :wow_spells, :focus_object_id, :integer
  end
end
