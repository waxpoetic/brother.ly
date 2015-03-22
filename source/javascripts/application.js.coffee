#= require jquery

jQuery ->
  $('#mc-embedded-subscribe-form').on 'submit', (event) ->
    analytics.track 'Sign Up',
      name: $('input[name="mce-NAME"]').val()
      email: $('input[name="mce-EMAIL"]').val()
    $('#mc_embed_signup_scroll').fadeOut 250, ->
      $('#thank-you-message').show()

  $('.buttons a').on 'click', ->
    analytics.track 'Clicked Link',
      title: $(this).text()
      href: $(this).attr('href')
