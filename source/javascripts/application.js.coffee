#= require jquery

jQuery ->
  #$('.main-nav').sticky topPosition: 0
  $('#sign-up-form').on 'submit', ->
    analytics.track 'Sign Up',
      name: $('input[name="name"]').val()
      email: $('input[name="email"]').val()
    $(this).slideUp 150
    $('#thank-you-message').slideDown 150
