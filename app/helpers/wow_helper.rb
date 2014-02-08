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
    item = if id.is_a?(Wow::Item)
                    id
                  else
                    Wow::Item.select(:id, :name, :quality, :display_id).includes(:icon).find(id)
                  end
    if count > 1
      link_to item, class: "quality-#{item.quality} wow-link item" do
        html = wow_icon(item.icon_name, 18) do
          content_tag :div, class: 'frame-18 icon-overlay' do
            content_tag :div, count, class: "items-count"
          end
        end
        html << content_tag(:span, item.to_s, class: 'link-content')
        html.html_safe
      end
    else
      wow_link(item, item.icon_name, "quality-#{item.quality} item")
    end
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
    game_object = if id.is_a?(Wow::GameObject)
                   id
                 else
                   Wow::GameObject.find(id)
                 end
    wow_link(game_object, nil, 'game-object')
  rescue Exception
    content_tag(:span, "Unknown GameObject #{id}", class: 'yellow')
  end

  def wow_npc_link(id)
    npc = if id.is_a?(Wow::Creature)
                    id
                  else
                    Wow::Creature.find(id)
                  end
    wow_link(npc, nil, 'creature')
  rescue Exception
    content_tag(:span, "Unknown NPC #{id}", class: 'yellow')
  end

  def wow_spell_link(id)
    spell = if id.is_a?(Wow::Spell)
              id
            else
                Wow::Spell.unscoped.eager_load(:icon).find(id)
            end
    wow_link(spell, spell.icon_name, 'spell yellow')
  rescue Exception
    content_tag(:span, "Unknown Spell #{id}", class: 'yellow wow-link')
  end

  def power_cost_tooltip(spell)
    type = ''
    cost = spell.power_cost
    case spell.power_type
      when 0
        type = 'mana'
      when 1
        type = 'rage'
        cost = cost / 10
      when 2
        type = 'focus'
      when 3
        type = 'energy'
      else
        type = 'health'
        return if cost > 0
    end

    if cost > 0
      t("wow.tooltip_#{type}_cost", count: cost)
    elsif spell.power_cost_percent > 0
      t("wow.tooltip_#{type}_cost_percent", percent: spell.power_cost_percent)
    else
      nil
    end
  end

  def wowhead_link(category, id)
    prefix = (locale == :ru) ? 'ru' : 'www'
    link_to 'wowhead', "http://#{prefix}.wowhead.com/#{category}=#{id}", class: 'yellow wow-link', target: '_blank'
  end

  def format_money(amount)
    html = []
    if amount/10000 > 0
      html << content_tag(:span, amount / 10000, class: 'money-gold')
      amount = amount % 10000
    end

    if amount/100 > 0
      html << content_tag(:span, amount / 100, class: 'money-silver')
      amount = amount % 100
    end

    if amount > 0
      html << content_tag(:span, amount, class: 'money-copper')
    end
    html = html.join('')
    html.html_safe
  end

  def required_classes_list(classes)
    classes.map! { |c| t("wow.classes.#{Wow::Chars::Character::CLASSES[c]}")}
    classes.join(', ').html_safe
  end
end