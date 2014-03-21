$ ->
  'use strict'

  $('.coming-soon').popover({
    content: "to be continued...",
    placement: "bottom",
    container: "#nav-scroll"
  }).click(->
    elem = $(this)
    setTimeout(->
      elem.popover('hide')
    , 1500)
  )

  $('nav a,.nav-home').click((event) ->
    event.preventDefault()
    $('body').animate({scrollTop:$($(this).attr('href')).offset().top + 1}, 500)
  )

  window.onscroll = () ->
    if (window.pageYOffset > $('#home').height())
      log.error('ok')
