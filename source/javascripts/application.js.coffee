#= require jquery

jQuery ->
  $signup = $('#mc-embedded-subscribe-form')
  signup = $signup[0]
  analytics.trackForm signup, 'Signed Up'
  $signup.on 'submit', ->
    $('#mc_embed_signup_scroll').fadeOut 250, ->
      $('#thank-you-message').show()

  $('.buttons a').each (i, element) ->
    analytics.trackLink element, 'Clicked Link'
