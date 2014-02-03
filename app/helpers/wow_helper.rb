module WowHelper
  def wow_icon(icon, size = 36, &block)
    if block_given?
      content_tag :span, class: "icon-frame frame-#{size}", style: "background-image: url('http://eu.media.blizzard.com/wow/icons/#{size}/#{icon}.jpg');", &block
    else
      content_tag :span, class: "icon-frame frame-#{size}", style: "background-image: url('http://eu.media.blizzard.com/wow/icons/#{size}/#{icon}.jpg');" do
        content_tag :div, '', class: "frame-#{size} icon-overlay"
      end
    end
  end

  def wow_link(object, icon = nil, klass = 'yellow')
    link_to object, class: "#{klass} wow-link" do
      html = icon.nil? ? '' : wow_icon(icon, 18)
      html << content_tag(:span, object.to_s, class: 'link-content')
      html.html_safe
    end
  end

  def wow_item_link(id, count = 1)
    item = if id.is_a?(Wow::World::Item)
                    id
                  else
                    Wow::World::Item.find(id)
                  end
    wow_link(item, item.icon.name, item.quality)
  rescue Exception
    content_tag(:span, class: 'yellow') do
      if count > 1
        "Unknown Item #{id}, amount: #{count}"
      else
        "Unknown Item #{id}"
      end
    end
  end

  def wow_game_object_link(id)
    game_object = if id.is_a?(Wow::World::GameObject)
                   id
                 else
                   Wow::World::GameObject.find(id)
                 end
    wow_link(game_object)
  rescue Exception
    content_tag(:span, "Unknown GameObject #{id}", class: 'yellow')
  end

  def wow_npc_link(id)
    npc = if id.is_a?(Wow::World::Creature)
                    id
                  else
                    Wow::World::Creature.find(id)
                  end
    wow_link(npc)
  rescue Exception
    content_tag(:span, "Unknown NPC #{id}", class: 'yellow')
  end

  def wow_spell_link(id)
    spell = if id.is_a?(Wow::Spell)
              id
            else
                Wow::Spell.unscoped.eager_load(:icon).find(id)
            end
    wow_link(spell, spell.icon.name)
  rescue Exception
    content_tag(:span, "Unknown Spell #{id}", class: 'yellow wow-link')
  end
end