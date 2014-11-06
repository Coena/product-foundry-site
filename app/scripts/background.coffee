$ ->
  $('#background div.jumbotron')
    .each(() ->
      elem = $(this)
      elem.find('.bg-full-container').css('height', '0px')
    )
    .mouseenter(() ->
      elem = $(this)
      container = elem.find('.bg-full-container')
      targetHeight = container.find('.bg-full').height() + 60
      elem.addClass('expanded')
      container.animate({'height': targetHeight}, 200, () -> $('body').scrollspy('refresh'))
    )
    .mouseleave(() ->
      elem = $(this)
      container = elem.find('.bg-full-container')
      targetHeight = 0
      elem.removeClass('expanded')
      container.animate({'height': targetHeight}, 200, () -> $('body').scrollspy('refresh'))
    )
