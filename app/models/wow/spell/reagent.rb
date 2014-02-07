class Wow::Spell::Reagent < ActiveRecord::Base
  belongs_to :item, class_name: 'Wow::Item'
end
