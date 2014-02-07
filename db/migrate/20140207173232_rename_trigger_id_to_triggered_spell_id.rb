class RenameTriggerIdToTriggeredSpellId < ActiveRecord::Migration
  def change
    rename_column :wow_spell_effects, :trigger_id, :triggered_spell_id
  end
end
