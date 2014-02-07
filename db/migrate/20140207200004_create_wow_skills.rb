class CreateWowSkills < ActiveRecord::Migration
  def change
    create_table :wow_skills do |t|
      t.integer :category_id
      t.string :name_en
      t.string :name_ru
      t.string :description_en
      t.string :description_ru
      t.string :icon_id
    end
  end
end
