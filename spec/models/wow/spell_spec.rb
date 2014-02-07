require 'spec_helper'

describe Wow::Spell do
  describe 'tooltips and buff formatting' do
    it 'should be valid polymorph' do
      expected_tooltip = 'Transforms the enemy into a sheep, forcing it to wander around for up to 20 sec.'
      spell = FactoryGirl.create :polymorph
      spell.build_duration({base: 20000})

      spell.tooltip.should == expected_tooltip
    end

    context 'warsong food' do
      before(:each) do
        @spell = FactoryGirl.create :warsong_food
      end

      it 'should be valid description' do
        expected_tooltip = 'Restores 2148 health and 4410 mana over 30 sec.'
        @spell.tooltip.should == expected_tooltip
      end

      it 'should be valid buff' do
        expected_buff = 'Restores 71 health and 147 mana per second.'
        @spell.buff.should == expected_buff
      end
    end
  end

  describe 'icons' do
    it 'should be valid generic spell icon' do
      spell = FactoryGirl.create :polymorph
      spell_icon = Wow::Spell::Icon.find(spell.icon_id)

      spell.icon_name.should == spell_icon.name
    end

    it 'should be valid effect create item icon' do
      spell = FactoryGirl.create :craft_spell

      spell.icon_name.should == spell.created_items.first.icon_name
    end
  end
end
