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
      bgImage = elem.css('background-image')
      if (container.height() == 0)
        targetHeight = container.find('.bg-full').height() + 60
        elem.css('background-image', bgImage)
      else
        elem.css('background-image', '')

      container.animate({'height': targetHeight}, 500)
    )
