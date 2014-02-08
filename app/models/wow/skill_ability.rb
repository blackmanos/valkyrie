class Wow::SkillAbility < ActiveRecord::Base
  belongs_to :spell
  belongs_to :skill

  def classes
    a = []
    11.times do |i|
      a << (i+1) if (2 ** i & class_mask) > 0
    end
    a
  end
end
