class Wow::SkillAbility < ActiveRecord::Base
  belongs_to :spell
  belongs_to :skill
end
