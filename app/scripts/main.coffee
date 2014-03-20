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

  $('#nav-values').click(() ->
    duration = 1000

    $('#content').html($('#values').html())

    $('#pf-intro-container').animate({left: "-50%"}, duration)
    $('#values').animate({right: "45%"}, duration)
    $('#pf-logo').animate({width: "9%", "margin-left": "5px"}, duration)
  )
