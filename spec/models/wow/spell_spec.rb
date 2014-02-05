require 'spec_helper'

describe Wow::Spell do
  describe 'tooltips and buff formatting' do
    it 'should be valid polymorph' do
      expected_tooltip = 'Transforms the enemy into a sheep, forcing it to wander around for up to 20 sec.'
      attr = FactoryGirl.attributes_for :polymorph
      spell = Wow::Spell.create attr
      spell.build_duration({base: 20000})

      spell.tooltip.should == expected_tooltip
    end

    context 'warsong food' do
      before(:each) do
        @spell = FactoryGirl.create :warsong_food
        @trigger_1 = FactoryGirl.create :warsong_food_trigger_1
        @trigger_2 = FactoryGirl.create :warsong_food_trigger_2
        @trigger_1.build_duration({base: 30000})
        @trigger_2.build_duration({base: 30000})
        @trigger_1.save
        @trigger_2.save
        @spell.effect_1_trigger_spell = @trigger_1.id
        @spell.effect_2_trigger_spell = @trigger_2.id
      end

      it 'should be valid description' do
        expected_tooltip = 'Restores 2148 health and 4410 mana over 30 sec.'
        @spell.tooltip.should == expected_tooltip
      end

      it 'should be valid buff' do
        expected_buff = 'Restores 71 health and 147 mana per second.'
        @spell.tooltip
        @spell.buff.should == expected_buff
      end
    end
  end
end
