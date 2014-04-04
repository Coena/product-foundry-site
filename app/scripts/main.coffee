$ ->
  'use strict'

  scrollToPosition = (event) ->
    if event?
      event.preventDefault()

    target = $(this).attr('href')
    $('body').animate({scrollTop:$(target).offset().top + 1}, 500, () ->
      window.location.hash = target
    )

  $('nav a,.nav-home').click(scrollToPosition)

  $('body').scrollspy({ target: '#pf-nav-content' })

  isFixedControls = () -> window.pageYOffset > $('#home').height()

  fixedControls = isFixedControls()

  window.onscroll = () ->
    shouldFixControls = isFixedControls()

    if (fixedControls != shouldFixControls)
      fixedControls = shouldFixControls

      if (shouldFixControls)
        $('#pf-logo-content,#pf-nav-content').css('position', 'fixed')
      else
        $('#pf-logo-content,#pf-nav-content').css('position', 'absolute')
