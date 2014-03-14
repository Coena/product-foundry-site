$ ->
  'use strict'

  $('nav#nav-home a').click( ->
    _gaq.push(['_trackEvent', 'Home', 'Navigate', $(this).attr('rel')]);
  )
