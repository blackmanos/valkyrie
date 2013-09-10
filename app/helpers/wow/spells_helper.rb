module Wow::SpellsHelper
  def wow_spell_icon(spell, size = 36)
    content_tag :span, '', class: "icon-frame frame-#{size}", style: "background-image: url('http://eu.media.blizzard.com/wow/icons/#{size}/#{spell.icon.name}.jpg');"
  end
end
