class CreateWowIcons < ActiveRecord::Migration
  def change
    create_table :wow_icons do |t|
      t.string :icon
    end
  end
end
