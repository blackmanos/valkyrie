module Wow::SpellsHelper

  # @param effect Wow::Spell::Effect
  def wow_spell_effect_info(effect)
    id = effect.type
    aura = effect.aura_id
    small = []
    html = "(#{id})"
    html << " #{effect.name}"
    if effect.misc_value?
      case id
        when 50, 76, 104 # Create object
          small << "#{I18n.t('wow.object')}: #{wow_game_object_link(effect.misc_value)}".html_safe
        when 118 # Require Skill
          #TODO: Add Skill link
          html << " (#{effect.misc_value})"
        when 75, 87, 88, 89, 90 # Totems
          html << " (#{wow_npc_link(effect.misc_value)})"
        when 6
        else
          html << " (#{effect.misc_value})"
      end
    end

    html << " (#{t("wow.schools.#{effect.spell.school}")})" if id == 2 && effect.spell.resistance_id

    if effect.radius_id?
      small << "#{I18n.t('wow.radius')}: #{I18n.t('wow.range_with_unit', count: effect.radius.base)}"
    end

    small << "#{I18n.t('wow.value')}: #{effect.base_points + 1}" if effect.base_points? and !effect.item_id?

    if effect.amplitude?
      small << "#{I18n.t('wow.interval')}: #{I18n.t('wow.duration', count: effect.amplitude)}"
    end

    if effect.aura_id? and !effect.aura.nil?
      html << ": #{effect.aura}"
      case aura
        when 56, 78
          html << " (#{wow_npc_link(effect.misc_value)})"
        else
          html << " (#{effect.misc_value})" if effect.misc_value?
      end
    elsif aura > 0
      html << ": Unknown Aura(#{aura})"
    end

    if id == 24
      html << tag(:br)
      html << wow_item_link(effect.item_id, effect.base_points + 1).to_s
    end

    if effect.triggered_spell_id?
      html << tag(:br)
      html << wow_spell_link(effect.triggered_spell_id)
    end

    small.map! { |item| content_tag(:small, item) }
    small = small.join(tag(:br))
    unless small.blank?
      html << tag(:br)
      html << small
    end
    html.html_safe
  end

  def reagents_links(reagents)
    links = []
    reagents.each do |r|
      link = link_to(r.item.name, r.item, class: 'wow-link default')
      link << content_tag(:span, " (#{r.amount})", class: 'wow-link default') if r.amount > 1
      links << link
    end
    links.join(', ').html_safe
  end

  def tools_links(tools)
    links = []
    tools.each do |t|
      links << link_to(t.name, t, class: 'wow-link default')
    end
    links.join(', ').html_safe
  end

  def skill_difficulty(skill_ability)
    "#{skill_ability.learn_value} #{skill_ability.min_value} #{(skill_ability.min_value + skill_ability.max_value)/2} #{skill_ability.max_value}"
  end
end
