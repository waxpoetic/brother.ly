#= require jquery

jQuery ->
  $('#sign-up-form').on 'submit', ->
    analytics.track 'Sign Up',
      name: $('input[name="name"]').val()
      email: $('input[name="email"]').val()
    $(this).slideUp 150
    $('#thank-you-message').slideDown 150

  $('.buttons a').on 'click', ->
    analytics.track 'Clicked Link',
      title: $(this).text()
      href: $(this).attr('href')
