# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_focus_object, :class => 'Wow::Spell::FocusObject' do
    name_ru "MyString"
    name_en "MyString"
  end
end
