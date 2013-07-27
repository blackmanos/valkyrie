$ ->
  $(document).on 'click', '#pvp-statistic table th a', () ->
    $.getScript this.href
    false
