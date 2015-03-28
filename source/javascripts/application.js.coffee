#= require jquery
#= require fake_analytics

jQuery ->
  analytics.page $('meta[name="page-name"]').attr('content')

  $('#mc-embedded-subscribe-form').on 'submit', (event) ->
    analytics.trackForm event.currentTarget, 'Signed Up'

  $('.buttons a').on 'click', (event) ->
    analytics.trackLink event.currentTarget, 'Clicked Link'
