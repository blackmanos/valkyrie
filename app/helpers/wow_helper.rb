module WowHelper
  def wow_icon(icon, size = 36)
    content_tag :span, '', class: "icon-frame frame-#{size}", style: "background-image: url('http://eu.media.blizzard.com/wow/icons/#{size}/#{icon}.jpg');"
  end

  def wow_spell_effect_info(spell, i)
    id = spell.effect_id(i)
    aura = spell.effect_aura(i)
    small =''
    output = "(#{id})"
    output << " #{spell.effect_name(id)}"
    if spell.effect_misc_value(i) > 0
      case id
        when 50, 76, 104 # Create object
          #TODO: Add object link
          small << "#{I18n.t('wow.object')}: #{spell.effect_misc_value(i)}"
        when 118 # Require Skill
          #TODO: Add Skill link
          output << " (#{spell.effect_misc_value(i)})"
        when 75, 87, 88, 89, 90 # Totems
          #TODO: Add NPC link
          output << " (#{spell.effect_misc_value(i)})"
        when 6
        else
          output << " (#{spell.effect_misc_value(i)})"
      end
    end

    output << " (#{t("wow.schools.#{spell.school}")})" if id == 2 && spell.resistance_id

    if spell.effect_radius(i) > 0
      radius = Wow::Spell::Radius.find(spell.effect_radius(i)).base
      small << "#{I18n.t('wow.radius')}: #{I18n.t('wow.range_with_unit', count: radius)}"
    end

    small << "#{I18n.t('wow.value')}: #{spell.effect_base_points(i).to_i + 1}" if spell.effect_base_points(i) > 0 and spell.effect_item_type(i) == 0

    if spell.effect_amplitude(i) > 0
      interval = (spell.effect_amplitude(i) % 1000 > 0) ? (spell.effect_amplitude(i) / 1000.0) : (spell.effect_amplitude(i) / 1000)
      small << "#{I18n.t('wow.interval')}: #{I18n.t('wow.duration', count: interval)}"
    end

    if aura > 0 and !spell.aura_name(aura).nil?
      output << ": #{spell.aura_name(aura)}"
      case aura
        when 56, 78
          # TODO: NPC link
          output << " (#{spell.effect_misc_value(i)})"
        else
          output << " (#{spell.effect_misc_value(i)})" if spell.effect_misc_value(i) > 0
      end
    elsif aura > 0
      output << ": Unknown Aura(#{aura})"
    end

    if id == 24
      output << "<br />"
      output << wow_item_link(spell.effect_item_type(i), spell.effect_base_points(i).to_i + 1).to_s
    end

    if spell.effect_trigger_spell(i) > 0
      output << "<br />"
      output << wow_spell_link(spell.effect_trigger_spell(i))
    end

    output << "<br /><small>#{small}</small>" unless small.blank?
    output.html_safe
  end

  def wow_item_link(id, count)
    if count > 1
      "#{count} X #{id}"
    else
      id
    end
  end

  def wow_spell_link(id)
    spell = Wow::Spell.unscoped.eager_load(:icon).find(id)
    link_to "#{wow_icon(spell.icon.name, 18)} #{spell.name}".html_safe , wow_spell_path(spell), class: 'spell'
  end
end