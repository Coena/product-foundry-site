$ ->
  'use strict'

  $('a,div').click( ->
    elem = $(this)
    label = $(this).attr('rel')
    if label?
      categoryElem = elem.closest('section,nav')
      if categoryElem.length != 0
        category = categoryElem.attr('rel')
        action = if categoryElem.prop('tagName') == 'NAV' then 'Navigate' else 'Click'
        log.info(category, action, label)
        _gaq.push(['_trackEvent', category, action, label])
  )
