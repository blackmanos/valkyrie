module Wow::SpellsHelper
  def wow_spell_effect_info(spell, i)
    id = spell.effect_id(i)
    aura = spell.effect_aura(i)
    small = []
    html = "(#{id})"
    html << " #{spell.effect_name(id)}"
    if spell.effect_misc_value(i) > 0
      case id
        when 50, 76, 104 # Create object
          small << "#{I18n.t('wow.object')}: #{wow_game_object_link(spell.effect_misc_value(i))}".html_safe
        when 118 # Require Skill
          #TODO: Add Skill link
          html << " (#{spell.effect_misc_value(i)})"
        when 75, 87, 88, 89, 90 # Totems
          html << " (#{wow_npc_link(spell.effect_misc_value(i))})"
        when 6
        else
          html << " (#{spell.effect_misc_value(i)})"
      end
    end

    html << " (#{t("wow.schools.#{spell.school}")})" if id == 2 && spell.resistance_id

    if spell.effect_radius(i) > 0
      small << "#{I18n.t('wow.radius')}: #{I18n.t('wow.range_with_unit', count: spell.radius(i))}"
    end

    small << "#{I18n.t('wow.value')}: #{spell.effect_base_points(i).to_i + 1}" if spell.effect_base_points(i) > 0 and spell.effect_item_type(i) == 0

    if spell.effect_amplitude(i) > 0
      small << "#{I18n.t('wow.interval')}: #{I18n.t('wow.duration', count: spell.amplitude(i))}"
    end

    if aura > 0 and !spell.aura_name(aura).nil?
      html << ": #{spell.aura_name(aura)}"
      case aura
        when 56, 78
          html << " (#{wow_npc_link(spell.effect_misc_value(i))})"
        else
          html << " (#{spell.effect_misc_value(i)})" if spell.effect_misc_value(i) > 0
      end
    elsif aura > 0
      html << ": Unknown Aura(#{aura})"
    end

    if id == 24
      html << tag(:br)
      html << wow_item_link(spell.effect_item_type(i), spell.effect_base_points(i).to_i + 1).to_s
    end

    if spell.effect_trigger_spell(i) > 0
      html << tag(:br)
      html << wow_spell_link(spell.effect_trigger_spell(i))
    end

    small.map! { |item| content_tag(:small, item) }
    small = small.join(tag(:br))
    unless small.blank?
      html << tag(:br)
      html << small
    end
    html.html_safe
  end

  def reagents_links(spell)
    links = []
    (1..8).each_with_index do |i|
      unless spell.reagents(i).nil?
        link = link_to(spell.reagents(i).name, spell.reagents(i), class: 'wow-link default')
        link << content_tag(:span, " (#{spell.reagent_counts(i)})", class: 'wow-link default') if spell.reagent_counts(i) > 1
        links << link
      end
    end
    links.join(', ').html_safe
  end

  def tools_links(spell)
    links = []
    (1..2).each_with_index do |i|
      links << link_to(spell.tools(i).name, spell.tools(i), class: 'wow-link default') unless spell.tools(i).nil?
    end
    links.join(', ').html_safe
  end
end
