#= require jquery
#= require fake_analytics

jQuery ->
  analytics.page $('meta[name="page-name"]').attr('content')

  $('#mc-embedded-subscribe-form').on 'submit', (event) ->
    analytics.trackForm event.currentTarget, 'Signed Up'

  $('.buttons a').on 'click', (event) ->
    analytics.trackLink event.currentTarget, 'Clicked Link'

  $('.artists li > a').on 'click', (event) ->
    event.preventDefault()
    href = $(this).attr 'href'
    $(href).find('.bio').slideToggle 150
    $(this).find('i').toggleClass('clicked').css(transform: 'rotate(90deg)')
