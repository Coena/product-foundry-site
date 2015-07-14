$ ->
    'use strict'

    $('.job-link').each ->
        $(this).on 'click', (e) ->
            e.preventDefault()
            jobDiv = $(this).attr('data-job')
            $('#jobs-intro').addClass 'hidden'
            $('.job-listing').addClass 'hidden'
            $('#' + jobDiv).removeClass 'hidden'
            return
        return
    $('.list-all-jobs').on 'click', (e) ->
        e.preventDefault()
        $(this).parent().addClass 'hidden'
        $('#jobs-intro').removeClass 'hidden'
        return