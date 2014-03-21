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

  $('nav a').click((event) ->
    event.preventDefault()
    $('body').animate({scrollTop:$($(this).attr('href')).offset().top + 1}, 500)
  )
