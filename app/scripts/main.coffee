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
