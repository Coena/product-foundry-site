$ ->
  'use strict'

  currentDate = new Date()
  $('#current-year').text((currentDate).getFullYear())

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

  window.onscroll = () ->
    shouldFixControls = isFixedControls()

    if (shouldFixControls)
      $('#pf-logo-content,#pf-nav-content').css('position', 'fixed')
    else
      $('#pf-logo-content,#pf-nav-content').css('position', 'absolute')

  $("#portfolio a[href=\"#\"]").each ->
    $(this).on "click", (e) ->
      e.preventDefault()
      return

    return
