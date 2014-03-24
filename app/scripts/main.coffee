$ ->
  'use strict'

  $('nav a,.nav-home').click((event) ->
    event.preventDefault()
    target = $(this).attr('href')
    $('body').animate({scrollTop:$(target).offset().top + 1}, 500, () ->
      window.location.hash = target
    )
  )

  $('body').scrollspy({ target: '#controls' })

  window.onscroll = () ->
    if (window.pageYOffset > $('#home').height())
      $('#controls').css('position', 'fixed')
    else
      $('#controls').css('position', 'absolute')
