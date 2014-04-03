$ ->
  $('#background div.jumbotron')
    .each(() ->
      elem = $(this)
      elem.find('.bg-full-container').css('height', '0px')
    )
    .click((e) ->
      if (e.target.tagName.toLowerCase() == 'a')
        return

      e.preventDefault()

      elem = $(this)

      container = elem.find('.bg-full-container')
      targetHeight = 0
      if (container.height() == 0)
        targetHeight = container.find('.bg-full').height() + 60
        elem.addClass('expanded')
      else
        elem.removeClass('expanded')

      container.animate({'height': targetHeight}, 500, () -> $('body').scrollspy('refresh'))
    )
