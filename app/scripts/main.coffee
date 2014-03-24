$ ->
  'use strict'

  $('nav a,.nav-home').click((event) ->
    event.preventDefault()
    target = $(this).attr('href')
    $('body').animate({scrollTop:$(target).offset().top + 1}, 500, () ->
      window.location.hash = target
    )
  )

  $('body').scrollspy({ target: '#pf-nav-content' })

  window.onscroll = () ->
    if (window.pageYOffset > $('#home').height())
      $('#pf-logo-content,#pf-nav-content').css('position', 'fixed')
    else
      $('#pf-logo-content,#pf-nav-content').css('position', 'absolute')
