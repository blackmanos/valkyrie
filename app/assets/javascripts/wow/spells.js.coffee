$ ->
  blurWidth = 0

  applyBlur = (el) ->
    el = $(el)
    return if blurWidth == el.width()
    blurWidth = el.width()
    offsets = el.offset()
    windowWidth = Math.max document.documentElement["clientWidth"], document.body["scrollWidth"], document.documentElement["scrollWidth"], document.body["offsetWidth"], document.documentElement["offsetWidth"]
    imageWidth = 1024
    imageWidth = 1280 if windowWidth > 1024
    imageWidth = 1920 if windowWidth > 1280

    el.css('background-position-x', -(offsets.left-(windowWidth-imageWidth)/2))
    el.css('background-position-y', -(offsets.top+200))
    el.css('background-image', $('body').css('background-image'))

  applyBlur('.blur-overlay')

  window.onresize = () ->
    applyBlur('.blur-overlay')